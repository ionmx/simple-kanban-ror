require "test_helper"

class ColumnTest < ActiveSupport::TestCase
  test "Should not save Column without title" do
    column = boards(:one).columns.new
    assert_not column.save, "Saved the column without title"
  end

  test "Should not save Column without board_id" do
    column = Column.new
    assert_not column.save, "Saved the column without board_id"
  end

  test "Should increase the position of the column" do
    last_column = boards(:one).columns.last
    column = boards(:one).columns.new(title: "New column")
    assert column.save, "Could not save the column"
    assert_equal last_column.position + 1, column.position, "The position of the column is not incremented by 1"
  end
end
