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

  def destroy
    @game = Game.find_by(id: params[:id])
    if session[:user_id] == @game.creator_id
      @game.destroy
      redirect_to '/'
    else
      render 'show'
    end
  end

  def upvote
    @game = Game.find_by(id: params[:id])
    @upvote = @game.votes.create(value: 1, user_id: session[:user_id])
    redirect_to @game
  end

  def downvote
    @game = Game.find_by(id: params[:id])
    @downvote = @game.votes.create(value: -1, user_id: session[:user_id])
    redirect_to @game
  end

  private
    def game_params
      params.require(:game).permit(:name, :description, :creator_id, :avg_play_time, :min_players, :max_players)
    end

end
