class Column < ApplicationRecord
  belongs_to :board
  has_many :tasks,
           -> { select(:id, :column_id, :description, :position).order(:position) },
           dependent: :destroy,
           inverse_of: :column
  validates :title, presence: true

  before_create :set_column_position

  def set_column_position
    max = Column.where(board_id: self.board_id).maximum(:position)
    self.position = max ? max + 1 : 0
  end
end
