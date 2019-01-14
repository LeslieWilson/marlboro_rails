require 'spec_helper'

describe Contact do
  describe "#first_name" do
    it "has a first name" do
      contact = Contact.new(first_name: 'Jordan')
      expect(contact.first_name).to eq 'Jordan'
    end
  end

  describe "#last_name" do
    it "has a last name" do
      contact = Contact.new(last_name: 'Belfort')
      expect(contact.last_name).to eq 'Belfort'
    end
  end

  describe "#phone_number" do
    it "has a phone number" do
      contact = Contact.new(phone_number: '1234567890')
      expect(contact.phone_number).to eq '1234567890'
    end
  end

  describe "#name" do
    it "combines first and last names" do
      contact = Contact.new(first_name: 'Jordan', last_name: 'Belfort')
      expect(contact.name).to eq 'Jordan Belfort'
    end
  end
end
