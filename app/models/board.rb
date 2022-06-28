class Board < ApplicationRecord
  has_many :columns, -> { select(:id, :board_id, :title, :position).order(:position) }, dependent: :destroy

  after_save :add_default_columns

  def add_default_columns
    todo = self.columns.new
    todo.title = 'To Do'
    todo.save

    inproc = self.columns.new
    inproc.title = 'In Proccess'
    inproc.save

    done = self.columns.new
    done.title = 'Done'
    done.save
  end
end
