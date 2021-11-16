require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should have a name" do
      @category = Category.new(name: "instruments")
      @product = Product.new(name: nil, price_cents: 500000, quantity: 1, category: @category)
      @product.save
      expect(@product.name).to eq(nil)
      expect(@product.errors[:name]).to include("can't be blank")
    end

    it "should have a price" do
      @category = Category.new(name: "instruments")
      @product = Product.new(name: "piano", price_cents: nil, quantity: 1, category: @category)
      @product.save
      expect(@product.price_cents).to eq(nil)
      expect(@product.errors[:price]).to include("can't be blank")
    end

    it "should have a quantity" do
      @category = Category.new(name: "instruments")
      @product = Product.new(name: "piano", price_cents: 500000, quantity: nil, category: @category)
      @product.save
      expect(@product.quantity).to eq(nil)
      expect(@product.errors[:quantity]).to include("can't be blank")
    end

    it "should have a category" do
      @category = Category.new(name: "instruments")
      @product = Product.new(name: "piano", price_cents: 500000, quantity: 1, category: nil)
      @product.save
      expect(@product.category).to eq(nil)
      expect(@product.errors[:category]).to include("can't be blank")
    end

    it "should create a product if all validations are true" do
      @category = Category.new(name: "instruments")
      @product = Product.new(name: "piano", price_cents: 500000, quantity: 1, category: @category)
      @product.save
    end

  end
end