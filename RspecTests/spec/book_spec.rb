require 'spec_helper'


describe Book do

# before i run the test, I'm making this @book veriable
before :each do
    # making a new book with a title author and category
    @book = Book.new "title", "author", "category"

end


describe "#new" do
    it "returns a new book object" do
        expect(@book).to be_a(Book)
    end

    it " throws an argument error when given fewer than 3 parameters" do
        lambda { Book.new "title","Author" }.should raise_exception ArgumentError
        end
    end

end
