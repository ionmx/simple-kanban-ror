require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "Should not save Task without description" do
    task = Column.first.tasks.new
    assert_not task.save, "Saved the task without description"
  end
end
