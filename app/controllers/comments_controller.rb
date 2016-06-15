class CommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @comment = @game.comments.create(comment_params)
    redirect_to game_path(@game)
  end

def destroy
    @comment = Comment.find(params[:comment_id])
    @comment = @comment.comments.find(params[:id])
    @comment.destroy
    redirect_to comment_path(@comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :game_id)
    end

end
