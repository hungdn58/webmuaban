require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def new_card_with_one_product(product_name)
  	cart = Cart.create
  	cart.add_product(products(product_name).id,products(product_name).price)
  	cart
  end
  test 'cart should create a new line when adding a new product' do
  	cart = new_card_with_one_product(:one)
  	assert_equal 1,cart.line_items.size
  	assert_equal 9.99,cart.total_price
  	#add a new product
  	cart.add_product(products(:ruby).id,products(:ruby).price)
  	assert_equal 2,cart.line_items.size
  	assert_equal 59.49,cart.total_price
  end
  test 'cart should update an existing line item when adding an existing product' do
  	cart1 = Cart.create
    # Re-add the same product
    cart1.add_product(products(:one).id,products(:one).price)
    cart1.add_product(products(:one).id,products(:one).price)
    assert_equal 1, cart1.line_items.count
	end
end
