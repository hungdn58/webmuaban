class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
    @line_item = LineItem.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @line_item }
    end
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid line_item #{ params[ :id ]}" 
      redirect_to store_url, :notice => 'Invalid line item'
    end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id,product.price)

    respond_to do |format|
      if @line_item.save
        session[:counter] = 0
        format.html { redirect_to @line_item.cart }
        format.json { render json: @line_item, status: :created, location: @line_item }
      else
        format.html { render action:new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item = set_line_item
    @line_item.destroy
    respond_to do |format|
      if LineItem.find_by_cart_id(@line_item.cart_id).nil? 
        format.html { redirect_to store_url, 
             notice: 'Your cart is currently empty' }
      else
        format.html { redirect_to current_cart,
           notice: 'Line item removed' }
      end
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.require(:line_item).permit(:product_id, :cart_id)
    end
end
