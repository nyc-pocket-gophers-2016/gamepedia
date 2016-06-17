class GamesController < ApplicationController
  def index
    @games = Game.ordered + (Game.all - Game.ordered - Game.negative) + Game.negative
  end

  def show
    @new_tag = Tag.new
    @game = Game.find_by(id: params[:id])
  end

  def new
    if request.xhr?
      render '_new-game-form', layout: false
    else
      @game = Game.new
    end
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
    @upvote = @game.votes.find_or_create_by(user_id: session[:user_id])
    @upvote.update_attributes(value: 1)
    redirect_to @game
  end

  def downvote
    @game = Game.find_by(id: params[:id])
    @downvote = @game.votes.find_or_create_by(user_id: session[:user_id])
    @downvote.update_attributes(value: -1)
    redirect_to @game
  end

  def collect
    GameUser.find_or_create_by(game_id: params[:game_id], user_id: session['user_id'])
    redirect_to User.find(session['user_id'])
  end

  def uncollect
    (GameUser.find_by(game_id: params[:game_id], user_id: session['user_id'])).destroy
    redirect_to User.find(session['user_id'])
  end

  private
    def game_params
      params.require(:game).permit(:name, :description, :creator_id, :avg_play_time, :min_players, :max_players, :image)
    end

end
