require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:quantity) }

  end

  it "should have a name" do
    @category = Category.create(name:'Toys')
    @product = Product.create(name: nil,price: 20, quantity:100, category_id: @category.id)
    expect(@product.name).to eq(nil)
    expect(@product.errors.full_messages)
  end

  it "should have a price" do
    @category = Category.create(name:'Toys')
    @product = Product.create(name:'Barbie',price: nil, quantity:100, category_id: @category.id)
    expect(@product.price).to eq(nil)
    expect(@product.errors.full_messages)
  end

  it "should have a quantity" do
    @category = Category.create(name:'Toys')
    @product = Product.create(name:'Barbie',price: 20, quantity:nil, category_id: @category.id)
    expect(@product.quantity).to eq(nil)
    expect(@product.errors.full_messages)
  end

  it "should have a category" do
    @category = Category.create(name:'Toys')
    @product = Product.create(name:'Barbie',price: 20, quantity:100, category_id: nil)
    expect(@product.category_id).to eq(nil)
    expect(@product.errors.full_messages)
  end


end


