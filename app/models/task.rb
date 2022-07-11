class Task < ApplicationRecord
  belongs_to :column
  validates :description, presence: true

  before_create :set_task_position

  def set_task_position
    max = Task.where(column_id:).maximum(:position)
    self.position = max ? max + 1 : 0
  end
end
