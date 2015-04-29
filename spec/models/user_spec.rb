require 'spec_helper'

describe User do
  it "is invalid without a name" do
  	user = User.new
  	user.should_not be_valid
  end

  it "is valid" do
    user = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "12345678")
    user.should be_valid
  end

  it "is invalid with fail fomat email" do
    user = User.new(name: "Ngoc Hung", email: "trhung1710", password: "12345678")
    user.should_not be_valid
  end

  it "is invalid with password too short" do
    user = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "1234567")
    user.should_not be_valid
  end

  it "compare id" do
    user1 = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "12345678")
    user2 = User.new(name: "Ngoc Hung", email: "trhung1711@gmail.com", password: "12345678")
    user1.save
    user2.save
    expect(user1.id).should_not eq user2.id
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
<<<<<<< HEAD
  	user = User.new(name: "Ngoc Hung", email: "hoangnhat1090@gmail.com" , password: "2172372834")
=======
  	user = User.new(name: "Ngoc Hung", email: "trhung1710@gmail.com", password: "12345678")
  	expect(user.save).to be_truthy
>>>>>>> 1a6f1e3e68c6efb2c196783ec592c25318ba5bfb
  	expect { user.save }.to change { User.count }.from(0).to(1)
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