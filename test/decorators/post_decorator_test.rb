require 'test_helper'

class PostDecoratorTest < ActiveSupport::TestCase
  def setup
    @post = Post.new.extend PostDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
