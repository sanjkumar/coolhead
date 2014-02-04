class OrdersController < ApplicationController

  before_filter :ensure_admin, :except => [:index, :show]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
    @orders = Order.order('order_date DESC')


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new

    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    @order.add_orderproduct_from_cart(current_cart)



    respond_to do |format|
      if @order.save

        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil


        format.html do
          redirect_to @order, notice: 'Order was successfully created.'
        end
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: 'new' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end

    # Set your secret key: remember to change this to your live secret key in production
    # See your keys here https://manage.stripe.com/account
    #Stripe.api_key = 'sk_test_0agDMKIQ9oQlknSY5AdEFceD'

    # Get the credit card details submitted by the form
    # token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    #begin
    # charge = Stripe::Charge.create(
    #   :amount => 1000, # amount in cents, again
    #    :currency => 'eur',
    #   :card => token,
    #  :description => 'payinguser@example.com'
    #)
    #rescue Stripe::CardError => e
    # # The card has been declined
    #end
    #end
  end


  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  def shipped
    @order = Order.find(params[:id])
    OrderNotifier.order_shipped(@order).deliver
    respond_to do |format|
      if @order.update_attributes(params[:order])

        format.html { render action: 'shipped_edit' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def shipped_edit
    @order = Order.find(params[:id])
    @cart = current_cart

  end
end
