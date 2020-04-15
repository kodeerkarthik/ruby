class CommentsController < ApplicationController
  http_basic_authenticate_with name: 'admin', password:'gothilla', only: [:destroy]
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if(@comment.save)
      redirect_to article_path(@article)
    else
      flash.alert = "Your comment is not done, please try again with providing username should be >=3 letters"
      redirect_to articles_path
    end
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  private 
    def comment_params    
      params.require(:comment).permit(:username, :body)
    end
end
