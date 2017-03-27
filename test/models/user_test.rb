require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = User.new(name: "Sheldon" , email: "sheldo@gmail.com" , password: "spocktbbt" , password_confirmation: "spocktbbt")
  end
  	
  	test "user should be valid" do
  		assert @user.valid?  
  	end	

  	test "name should be present" do
  		@user.name = " "
  		assert_not @user.valid?
  	end

  	test "email should be present" do
  		@user.email = " "
  		assert_not @user.valid?
  	end

  	test "name shouldn't be too long" do
  		@user.name = "m" * 52 
  		assert_not @user.valid?
  	end

  	test "email should be too  long" do
  		@user.email = "m" * 245 + "@example.com"
  		assert_not @user.valid?
  	end

  	test "email should accept valid email address" do 
  		valid_addresses = %w[user@example.com user_1@gmail.com 123dafe@gmail.com]

  		valid_addresses.each do |v|
  			@user.email = v 
  			assert @user.valid? , "#{v.inspect} should be valid"
  		end
  	end

  	test "email should reject invalid addresses" do
  		invalid_addresses = %w[example.com  __example__atgmail mike@gmail,com mike#yahoo.com mike@gmail..com]

  		invalid_addresses.each do |invalid|
  			@user.email = invalid
  			assert_not @user.valid? , "#{invalid.inspect} should be invalid"
  		end
  	end

  	test "email address should be unique" do 
  		duplicate_user = @user.dup
  		duplicate_user.email = @user.email.upcase
  		@user.save
  		assert_not duplicate_user.valid?
  	end

  	test "password should not be blank" do
  		@user.password = " " * 5
  		@user.password_confirmation = @user.password
  		assert_not @user.valid?
  	end

  	test "password should not be less than 8" do
  		@user.password = @user.password_confirmation = "a" * 7
  		assert_not @user.valid?
  	end


end
