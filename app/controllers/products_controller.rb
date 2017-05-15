class ProductsController < ApplicationController
  before_action :authenticate_user!, only:[ :new, :edit, :update, :create, :destroy ]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all.order('created_at DESC')

    # if params[:product].blank?
    #   @products = Product.all.order('created_at DESC')
    # else
    #   @comment_id = Comment.find_by(body: params[:product]).id
    #   @products = Product.where(product_id: @product_id).order("created_at DESC")
    # end
  end

  def show
    @comments = Comment.where(product_id: @product).order("created_at DESC")
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = current_user.products.new(product_params)
    # @product = Product.new(product_params)

    if @product.save
      flash[:notice] = "Product Created"
      redirect_to @product
    else
      flash[:danger] = "Product not Created"
      render 'new'
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = "Product was successfully updated."
      redirect_to @product
    else
      flash[:notice] = "Product was not updated."
      render 'edit'
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end


  def product_params
    params.require(:product).permit(:name, :food_type, :description, :user_id)
  end
end
