require_relative "../code"

describe "plus_one" do
    it "should be one plus the number given" do
        result = plus_one(0)
        expect(result).to eq 1
    end
end
