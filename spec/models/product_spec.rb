require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "succeeds if all fields are valid" do
      @category = Category.new
      @product = Product.create(name: "rspec", category: @category, price: 1, quantity: 1)
      expect(@product.errors.full_messages).to be_empty
    end
    it "succeeds if name is blank" do
      @category = Category.new
      @product = Product.create(category: @category, price: 1, quantity: 1)
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "succeeds if price is blank" do
      @category = Category.new
      @product = Product.create(name: "rspec", category: @category, quantity: 1)
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "succeeds if quantity is blank" do
      @category = Category.new
      @product = Product.create(name: "rspec", category: @category, price: 1)
      expect(@product.errors.full_messages).not_to be_empty
    end
    it "succeeds if category is blank" do
      @product = Product.create(name: "rspec", price: 1, quantity: 1)
      expect(@product.errors.full_messages).not_to be_empty
    end
  end
end
