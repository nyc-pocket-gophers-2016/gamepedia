class GamesController < ApplicationController
  def index
    @games = Game.order("name ASC")
  end

  def show
    @game = Game.find_by(id: params[:id])
  end

  def new
    @game = Game.new
  end

  def edit
    @game = Game.find_by(id: params[:id])
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game
    else
      render 'new'
    end
  end


  def update
  @game = Game.find_by(id: params[:id])
    if @game.update(game_params)
      redirect_to @game
    else
      render 'edit'
    end
  end


  private
    def game_params
      params.require(:game).permit(:name, :description, :creator_id, :avg_play_time, :min_players, :max_players)
    end


end
