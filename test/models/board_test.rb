require "test_helper"

class BoardTest < ActiveSupport::TestCase
  test "Should not save Board without title" do
    board = Board.new
    assert_not board.save, "Saved the board without title"
  end

  test "Should create default columns" do
    board = Board.new
    board.title = 'My Board'
    assert board.save, "Saved board"
    cols = board.columns
    assert_equal 3, cols.size, "Board doesn't have 3 columns"
    assert_equal 'To Do', cols[0].title, "First board must be called 'To Do'"
    assert_equal 'In Proccess', cols[1].title, "Second board must be called 'In Progress'"
    assert_equal 'Done', cols[2].title, "Third board must be called 'Done'"
  end
end
