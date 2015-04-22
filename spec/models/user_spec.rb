require 'spec_helper'

describe User do
  it "is invalid without a name" do
  	user = User.new
  	user.should_not be_valid
  end

  it "has a name that matches 'Ngoc Hung'" do
  	user = User.new(name: "Ngoc Hung 1")
  	user.name.should match(/Ngoc Hung \d/)
  end

  it "include products" do
  	product1 = Product.new(title: "haha")
  	product2 = Product.new(title: "hehe")

  	user = User.new(name: "Ngoc Hung", products: [product1, product2])
  	user.products.should include (product1)
  	user.products.should include (product2)
  end

  it "changes the number of User" do
  	user = User.new(name: "Ngoc Hung")
  	pending "Lỗi khó hiểu, sẽ xử lý sau"
  	expect(user.save).to be_falsey 
  	expect { user.save }.to change { User.count }.from(0).to(1)
  	pending
  end

  it "raises an error if save user without require attributes" do
  	user = User.new
  	expect { user.save! }.to raise_error(
  		ActiveRecord::RecordInvalid)
  end

  it { should respond_to(:name) }

  context "Test with DRY" do
  	let(:user) {User.new(name: "Ngoc Hung", products: [product]) }
  	let(:product) {Product.new(title: "xe may")}
  	subject { user }
  	its(:products) { should include(product) }

  	context "name should be nil" do
  		let(:user) {User.create}
  		subject { user }
  		its(:name) { should be_nil }
  	end
  end
end