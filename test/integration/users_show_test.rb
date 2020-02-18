require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  # 
  # 
  
  def setup
    ActionMailer::Base.deliveries.clear
  end

  test "unactivated user redirects to index" do
    @user = users(:new_user)
    get user_path(@user)
    assert_redirected_to root_url
    @user.activate
    get user_path(@user)
    assert_template 'users/show'
  end
end