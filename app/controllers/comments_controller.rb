#require 'pry'

class CommentsController < ApplicationController
  def index
    @comments = Comment.all
     respond_to do |format|
        format.json { render :json => @comments }
      end
  end

  # def show
  #   @comment = Comment.find(params[:id])
  # end

  def create
    @comment = Comment.new
    @post = Post.find(params:[post_id])
    @comment.post_id = @post.id
    @comment.content = params[:content]

    if @comment.save
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment created."
          redirect_to root_path
        end
        format.json { render :json => @comment, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @comment.errors, :status => 422 }
      end
    end
  end

  # def edit
  #   @comment = Comment.find(params[:id])
  #   render('comments/edit.html.erb')
  # end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(params[:comment])
      respond_to do |format|
        format.html do
          flash[:notice] = "Comment updated."
          redirect_to root_path
        end
        format.json { render :json => @comment, :status => 201 }
      end
    else
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render :json => @comment.errors, :status => 422 }
      end
    end
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html do
        flash[:notice] = "Comment deleted."
        redirect_to root_path
      end
      format.json { head :no_content }
    end
  end

private

  def comment_params
    params.require(:comment).permit(:content, :post)
  end

end
