class TagsController < ApplicationController
  def index
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def new
  end

  def create
    @game = Game.find(params['game_id'])
    @tag = Tag.find_or_create_by(tag_params)
    GameTag.find_or_create_by(game_id: params['game_id'], tag_id: @tag.id)
    redirect_to @game
  end

  private
    def tag_params
      params.require(:tag).permit(:name)
    end
end
