require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "a user should enter a first name" do
  	user = User.new
    assert !user.save
    assert !user.errors[:first_name].empty?
  end

  test "a user should enter a last name" do
  	user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should enter a nickname" do
  	user = User.new
    assert !user.save
    assert !user.errors[:last_name].empty?
  end

  test "a user should have a unique nickname" do
  	user = User.new
  	user.nickname = users(:jason).nickname
  	assert !user.save
   	assert !user.errors[:nickname].empty?
  end

  test "a user should have a nickname without spaces" do
    user = User.new
    user.nickname = "My Profile With Spaces"

    assert !user.save
    assert !user.errors[:nickname].empty?
    assert user.errors[:nickname].include?("Must be formatted correctly.")
  end

  test "a user can have a correctly formatted nickname" do
    user = User.new(first_name: 'Jason', last_name: 'Seifer', email: 'jason2@teamtreehouse.com')
    user.password = user.password_confirmation = 'asdfasdf'

    user.nickname = 'jasonseifer_1'
    assert user.valid?
  end

end
