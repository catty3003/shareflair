ENV["RAILS_ENV"] ||= "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
	test "product can not be saved without title" do
 		product = Product.new
 		assert !product.save
	end

	test "Product can be saved with all atributs" do
		p = Product.new
		p.title = "MyString"
	  p.category_id= 1
	  p.target_group= "MyString"
	  p.size= "MyString"
	  p.color= "MyString"
	  p.price= "MyString"
	  p.duration= "MyString"
	  p.description= "MyText"
	  p.user_id= 1
	  p.active= false
	  p.image= "String"
		assert p.save
	end 

end

