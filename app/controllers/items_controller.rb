class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy move ]

  def add_item_to_cart
    Item.find(params[:item_id]).add_to_cart!

    respond_to do |format|
      flash[:notice] = "Item added to cart"
      format.js {render inline: "location.reload();" }
    end
  end

  def remove_item_from_cart
    Item.find(params[:item_id]).remove_from_cart!

    respond_to do |format|
      flash[:alert] = "Item removed from cart"
      format.js {render inline: "location.reload();" }
    end
  end


  def move
    if @item.stock?
      @item.cart!
    end

    respond_to do |format|
      #format.html { redirect_to items_url, notice: "Item updated" }
    end
  end

  # GET /items or /items.json
  def index
    @items = Item.all
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to item_url(@item), notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
      format.js
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def item_params
    params.require(:item).permit(:name, :category, :status, :picture, :amount, :user_id)
  end

  def cart
    render({ :template => "items/category.html.erb" })
  end
end
