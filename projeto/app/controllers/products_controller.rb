class ProductsController < ApplicationController
    load_and_authorize_resource
    before_action :authenticate_user! 
    before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    if (params[:category_id].present?)
      @products = Product.where(cat_id: params[:category_id])
    else
      @products = Product.all
    end
    puts params[:category_id]
  end

  # GET /products/1
  # GET /products/1.json
  def show
    puts params
    @comments = Comment.where(product_id: params[:id])
  end

  # GET /products/new
  def new
    @product = Product.new
    
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params.merge(cat_id: params[:category_id]))
    respond_to do |format|
      if @product.save
        format.html { redirect_to dashboard_index_path, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to dashboard_index_path, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to category_products_path(@product.cat_id), notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :desc, :cat_id)
    end
end
