require "spec_helper"

xdescribe Article do
  let(:title) { "Valid Title" }
  let(:url) { "https://www.google.com" }
  let(:description) { "Valid description text" }
  let(:article) do
    Article.new({
      "title" => title,
      "url" => url,
      "description" => description
    })
  end
  let(:article_initialized_without_arguments) { Article.new }

  describe ".new" do
    it "should return a Article object" do
      expect(article).to be_a(Article)
    end

    it "should not raise an error when initialized without any arguments" do
      expect{ article_initialized_without_arguments }.to_not raise_error
    end
  end

  describe "#title" do
    it "should return the title" do
      expect(article.title).to eq(title)
    end

    it "should return nil for an article initialized without arguments" do
      expect(article_initialized_without_arguments.title).to eq(nil)
    end
  end

  describe "#url" do
    it "should return the url" do
      expect(article.url).to eq(url)
    end

    it "should return nil for an article initialized without arguments" do
      expect(article_initialized_without_arguments.url).to eq(nil)
    end
  end

  describe "#description" do
    it "should return the description" do
      expect(article.description).to eq(description)
    end

    it "should return nil for an article initialized without arguments" do
      expect(article_initialized_without_arguments.description).to eq(nil)
    end
  end

  describe ".all" do
    it "should return an array of Article objects from the database" do
      first_article_data = [
        "Valid Title 1",
        "https://www.google.com",
        "Valid description text 1"
      ]

      last_article_data = [
        "Valid Title 2",
        "https://www.amazon.com",
        "Valid description text 2"
      ]

      db_connection do |conn|
        sql_query = %(
          INSERT INTO articles (title, url, description)
          VALUES ($1, $2, $3)
        )
        conn.exec_params(sql_query, first_article_data)
        conn.exec_params(sql_query, last_article_data)
      end

      articles = Article.all
      first_article = articles.first
      first_article_attributes = [
        first_article.title,
        first_article.url,
        first_article.description,
      ]
      last_article = articles.last
      last_article_attributes = [
        last_article.title,
        last_article.url,
        last_article.description
      ]

      expect(articles).to be_a(Array)
      expect(first_article).to be_a(Article)
      expect(last_article).to be_a(Article)
      expect(first_article_attributes).to eq(first_article_data)
      expect(last_article_attributes).to eq(last_article_data)
    end
  end

  describe "#errors" do
    it "should return an empty array for a newly initialized object" do
      expect(article.errors).to eq([])
    end
  end

  describe "#valid?" do
    context "for a valid object" do
      it "should return true" do
        expect(article.valid?).to eq(true)
      end

      it "should not add any error messages" do
        article.valid?
        expect(article.errors).to eq([])
      end
    end

    context "for an invalid object" do
      let(:article_with_blank_attributes) do
        Article.new({ "title" => "", "url" => "", "description" => "" })
      end

      let(:article_with_invalid_url) do
        Article.new({
          "title" => title,
          "url" => "invalid url",
          "description" => description
        })
      end

      let(:article_with_too_short_description) do
        Article.new({
          "title" => title,
          "url" => url,
          "description" => "hi mom"
        })
      end

      let(:article_with_invalid_attributes) do
        Article.new({
          "title" => "",
          "url" => "invalid url",
          "description" => "hi mom"
        })
      end

      let(:missing_fields_message) { "Please completely fill out form" }
      let(:invalid_url_message) { "Invalid URL" }
      let(:url_already_exists_message) { "Article with same url already submitted" }
      let(:description_too_short_message) { "Description must be at least 20 characters long" }

      it "should return false" do
        expect(article_with_blank_attributes.valid?).to eq(false)
      end

      it "should add an error message if any of the attributes are blank" do
        article_with_blank_attributes.valid?
        expect(article_with_blank_attributes.errors).to eq([missing_fields_message])
      end

      it "should add an error message if the url is invalid" do
        article_with_invalid_url.valid?
        expect(article_with_invalid_url.errors).to eq([invalid_url_message])
      end

      it "should add an error message if there is a duplicate article" do
        db_connection do |conn|
          sql_query = %(
            INSERT INTO articles (title, url, description)
            VALUES ($1, $2, $3)
          )
          data = [title, url, description]
          conn.exec_params(sql_query, data)
        end

        article.valid?
        expect(article.errors).to eq([url_already_exists_message])
      end

      it "should add an error message if the description is too short" do
        article_with_too_short_description.valid?
        expect(article_with_too_short_description.errors).
          to eq([description_too_short_message])
      end

      it "should be able to add multiple error messages" do
        article_with_invalid_attributes.valid?
        expect(article_with_invalid_attributes.errors).to include(
          missing_fields_message,
          invalid_url_message,
          description_too_short_message
        )
      end
    end
  end

  describe "#save" do
    context "valid object" do
      it "should return true" do
        expect(article.save).to eq(true)
      end

      it "should add the attributes to the database" do
        article.save

        article_attributes = [
          article.title,
          article.url,
          article.description
        ]

        articles_data = nil
        db_connection do |conn|
          sql_query = "SELECT title, url, description FROM articles"
          articles_data = conn.exec(sql_query)
        end
        article_data = articles_data.to_a.last.values

        expect(article_attributes).to eq(article_data)
      end
    end

    context "invalid object" do
      let(:article_with_blank_attributes) do
        Article.new({"title" => "", "url" => "", "description" => ""})
      end

      it "should return false" do
        expect(article_with_blank_attributes.save).to eq(false)
      end

      it "should not add the attributes to the database" do
        article_with_blank_attributes.save

        articles_data = nil
        db_connection do |conn|
          sql_query = "SELECT title, url, description FROM articles"
          articles_data = conn.exec(sql_query)
        end

        expect(articles_data.count).to eq(0)
      end
    end
  end
end
