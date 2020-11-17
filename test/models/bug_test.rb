require 'test_helper'

class BugTest < ActiveSupport::TestCase
  	def setup
  	@bug=Bug.new
  	end

  	test "should have a valid name" do
  		@bug.title=""
  		assert_not @bug.valid?
  	end

end
