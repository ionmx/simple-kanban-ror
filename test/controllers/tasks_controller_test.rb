require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get board_column_tasks_url(@task.column.board_id, @task.column_id), as: :json
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post board_column_tasks_url(@task.column.board_id, @task.column_id), params: { task: { column_id: @task.column_id, description: @task.description, position: @task.position } }, as: :json
    end

    assert_response :created
  end

  test "should show task" do
    get board_column_task_url(@task.column.board_id, @task.column_id, @task), as: :json
    assert_response :success
  end

  test "should update task" do
    patch board_column_task_url(@task.column.board_id, @task.column_id, @task), params: { task: { column_id: @task.column_id, description: @task.description, position: @task.position } }, as: :json
    assert_response :success
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete board_column_task_url(@task.column.board_id, @task.column_id, @task), as: :json
    end

    assert_response :no_content
  end
end
