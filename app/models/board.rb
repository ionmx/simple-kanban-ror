class Board < ApplicationRecord
  has_many :columns,
           -> { select(:id, :board_id, :title, :position).order(:position) },
           inverse_of: :board,
           dependent: :destroy
  validates :title, presence: true

  after_save :add_default_columns

  def add_default_columns
    todo = columns.new
    todo.title = "To Do"
    todo.save

    inproc = columns.new
    inproc.title = "In Proccess"
    inproc.save

    done = columns.new
    done.title = "Done"
    done.save
  end
end
