require "test_helper"

class ColumnsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @column = columns(:one)
  end

  test "should get index" do
    get board_columns_url(@column.board_id), as: :json
    assert_response :success
  end

  test "should create column" do
    assert_difference("Column.count") do
      post board_columns_url(@column.board_id),
           params: { column: { board_id: @column.board_id,
                               position: @column.position,
                               title: @column.title } },
           as: :json
    end

    assert_response :created
  end

  test "should show column" do
    get board_column_url(@column.board_id, @column), as: :json
    assert_response :success
  end

  test "should update column" do
    patch board_column_url(@column.board_id, @column),
          params: { column: { board_id: @column.board_id,
                              position: @column.position,
                              title: @column.title } },
          as: :json
    assert_response :success
  end

  test "should destroy column" do
    assert_difference("Column.count", -1) do
      delete board_column_url(@column.board_id, @column), as: :json
    end

    assert_response :no_content
  end
end
