class ProductsController < ApplicationController

#before_filter :authenticate_user!
#before_filter :ensure_admin, :only => [:new, :create, :edit, :destroy]

  before_filter :ensure_admin, :except => [:index, :show, :category, :search]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
    @products = Product.order('title ASC')
    @products = @products.by_category_id(params[:cat]) if params[:cat].present?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    #@product.assign_attributes({ :category_ids => [1,2], :name => 'hello' })
    #@product.category_ids # => []
    #@article.name # => 'hello'

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])
    @product.category = Category.find(params[:id]) if params[:id]
    #@product = current_user.products.build(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def search
    @search_term = params[:q]
    st = "%#{params[:q]}%"
    @products = Product.where('Title like ? or Description like ? or Category like ?', st, st, st)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def category
    @products = Product.find_all_by_category(params[:id])
    @category = params[:id]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def who_bought
    @product = Product.find(params[:id])
    respond_to do |format|
      format.atom
      format.xml { render :xml => @product }
    end
  end

end
