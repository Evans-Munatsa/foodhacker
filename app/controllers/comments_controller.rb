class CommentsController < ApplicationController
  before_action :find_product
  before_action :find_comment, only: [:destroy]
  
  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end
  
  def create
    @comment = @product.comments.create(params[:comment].permit(:body))
    @comment.user_id = current_user.id
    @comment.save

    if @comment.save
      flash[:notice] = "Comment Posted"
      redirect_to product_path(@product)
    else
       flash[:alert] = "Comment not Posted"
      render 'new'
    end
  end
  

  def update
    if @comment.update(params[:comment].permit[:body])   
      flash[:notice] = "Comment Updates"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Comment not Updated"
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to product_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :product_id, :user_id)
  end

  def find_product
    @product = Product.find(params[:product_id])
  end

  def find_comment
    @comment = @product.comments.find(params[:id])
  end
end
