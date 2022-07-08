require "test_helper"

class TaskTest < ActiveSupport::TestCase
  test "Should not save Task without description" do
    task = columns(:one).tasks.new
    assert_not task.save, "Saved the task without description"
  end

  test "Should not save Task without column_id" do
    task = Task.new
    assert_not task.save, "Saved the task without column_id"
  end

  test "Should increase the position of the task" do
    last_task = columns(:one).tasks.last
    task = columns(:one).tasks.new(description: "New task")
    assert task.save, "Could not save the task"
    assert_equal last_task.position + 1, task.position, "The position of the task is not incremented by 1"
  end
end
