class ColumnsController < ApplicationController
  before_action :set_column, only: %i[ show update destroy ]

  # GET /columns
  def index
    @columns = Column.all

    render json: @columns
  end

  # GET /columns/1
  def show
    render json: @column
  end

  # POST /columns
  def create
    @board = Board.find(params["board_id"])
    @column = @board.columns.new(column_params)

    if @column.save
      render json: {data: @column}, status: :created
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /columns/1
  def update
    if @column.update(column_params)
      render json: @column
    else
      render json: @column.errors, status: :unprocessable_entity
    end
  end

  # DELETE /columns/1
  def destroy
    @column.destroy
  end

  def move_column
    @column = Column.find(params[:column])

    # Update source positions
    cols = Column.where('board_id = ? AND position > ?', @column.board_id, @column.position)
                .update_all("position = position - 1")

    # Update destination positions
    cols = Column.where('board_id = ? AND position >= ?', @column.board_id, params["position"])
                .update_all("position = position + 1")

    # Update task
    @column.position = params["position"]
    @column.save
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_column
      @column = Column.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def column_params
      params.require(:column).permit(:title, :position, :board_id)
    end
end
