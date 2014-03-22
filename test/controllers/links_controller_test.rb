require 'test_helper'

class LinksControllerTest < ActionController::TestCase
  test "going to /<token> works" do
    assert_recognizes({ controller: 'links', action: 'show', token: "goog" }, "/goog")
  end

  test "should get index" do
    Link.create(url: "www.google.com", token: "goog")
    assert_not_nil Link.find_by_token("goog")

    get :index

    assert assigns(:links)
    assert assigns(:links).count > 0
  end
end
