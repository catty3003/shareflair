class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :lady, :man, :girl, :boy, :baby, :last, :home, :about]
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_product_identification, only: [ :edit, :update, :destroy]
  

  # GET /products
  # GET /products.json
  def index   
    @products =Product.all
    
    s = "%#{params[:search]}%"
    if params[:sorting]
      @products_active = Product.where(active: true).order(params[:sorting] => :asc).where("title like ? or description like ?", s, s  )
      @products_active = @products_active.where(category_id: params[:category_id]) if params[:category_id]
      @products_active = @products_active.where(target_group: params[:target_group]) if params[:target_group]
      @products_active = @products_active.where(size: params[:size]) if params[:size]
      @products_active = @products_active.where(color: params[:color]) if params[:color]
      @products_active = @products_active.where(user_id: params[:user_id]) if params[:user_id]


      @products_inactive = Product.where(active: false).order(params[:sorting] => :asc).where("title like ? or description like ?", s, s  )
      @products_inactive = @products_inactive.where(category_id: params[:category_id]) if params[:category_id]
      @products_inactive = @products_inactive.where(target_group: params[:target_group]) if params[:target_group]
      @products_inactive = @products_inactive.where(size: params[:size]) if params[:size]
      @products_inactive = @products_inactive.where(color: params[:color]) if params[:color]
      @products_inactive = @products_inactive.where(user_id: params[:user_id]) if params[:user_id]


    else 
      
      @products_active = Product.where(active: true).order(updated_at: :desc).where("title like ? or description like ?", s, s  )
      @products_active = @products_active.where(category_id: params[:category_id]) if params[:category_id]
      @products_active = @products_active.where(target_group: params[:target_group]) if params[:target_group]
      @products_active = @products_active.where(size: params[:size]) if params[:size]
      @products_active = @products_active.where(color: params[:color]) if params[:color]
      @products_active = @products_active.where(user_id: params[:user_id]) if params[:user_id]


      @products_inactive = Product.where(active: false).order(updated_at: :desc).where("title like ? or description like ?", s, s  )
      @products_inactive = @products_inactive.where(category_id: params[:category_id]) if params[:category_id]
      @products_inactive = @products_inactive.where(target_group: params[:target_group]) if params[:target_group]
      @products_inactive = @products_inactive.where(size: params[:size]) if params[:size]
      @products_inactive = @products_inactive.where(color: params[:color]) if params[:color]
      @products_inactive = @products_inactive.where(user_id: params[:user_id]) if params[:user_id]


    end
  end

  # GET /products/1
  # GET /products/1.json
  def show

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
    @product = current_user.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
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
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def lady
    @products_active = Product.where(:target_group => "Ladies", active: true)
    @products_inactive = Product.where(:target_group => "Ladies", active: false)

  end

  def man
    @products_active = Product.where(:target_group => "Gentlemen", active: true)
    @products_inactive = Product.where(:target_group => "Gentlemen", active: false)
  end


  def girl
    @products_active = Product.where(:target_group => "Girls", active: true)
    @products_inactive = Product.where(:target_group => "Girls", active: false)
  end

  def boy
    @products_active = Product.where(:target_group => "Boys", active: true)
    @products_inactive = Product.where(:target_group => "Boys", active: false)
  end

  def baby
    @products_active = Product.where(:target_group => "Babies", active: true)
    @products_inactive = Product.where(:target_group => "Babies", active: false)
  end

  def last
    @products_active = Product.where(active: true).order(created_at: :desc).last(20)
  end

  def home
    @productslady = Product.where(:target_group => "Ladies")
    @productsgirl = Product.where(:target_group => "Girls")
    @productsgent = Product.where(:target_group => "Gentlemen")
    @productsboy = Product.where(:target_group => "Boys")
    @productsbaby = Product.where(:target_group => "Babies")
   end

  def about
    
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
       @product = Product.find(params[:id])
    end


    def set_product_identification
          @product = Product.find(params[:id])
          if @product.user_id != current_user.id
            redirect_to product_path, alert: 'You can edit oder delete only your own Products.'
          end
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:city, :name, :title, :active, :category_id, :target_group, :size, :color, :price, :duration, :description, :user_id, :image, :remote_image_url)
    end
end
