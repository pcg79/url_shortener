require 'test_helper'

class LinkTest < ActiveSupport::TestCase

  test "link generation works" do
    link = Link.new(url: "www.anything.com", token: "1")
    assert link.save
  end

end
