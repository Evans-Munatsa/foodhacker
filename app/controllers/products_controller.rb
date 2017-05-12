class ProductsController < ApplicationController
  # before_action :authenticate_user, only:[ :new, :edit, :update, :create, :destroy ]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    # @products = Product.all

    if params[:product].blank?
      @products = Product.all.order('created_at DESC')
    else
      @comment_id = Comment.find_by(body: params[:product]).id
      @products = Product.where(product_id: @product_id).order("created_at DESC")   
    end
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
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
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
      params.require(:product).permit(:name, :food_type, :description)
    end
end
