require "test_helper"

class ColumnTest < ActiveSupport::TestCase
  test "Should not save Column without title" do
    column = Board.first.columns.new
    assert_not column.save, "Saved the column without title"
  end
end
