class CustomerlistsController < ApplicationController
  def index
    @q = Customer.search(params[:q])
    @customers = @q.result.page(params[:page])
    #@customers = Customerlist.all
    #page(params[:page]) 
    #Customerlist.all
  end

  def new
    @customer = Customerlist.new
  end

  def create
    @customer = Customerlist.new(customer_params)
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
  end

  def edit
    @customer = Customerlist.find(params[:id])
  end

  def update
    @customer = Customerlist.find(params[:id])
    if  @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    @customer = Customerlist.find(params[:id])
  end

  def destroy
    @customer = Customerlist.find(params[:id])
    @customer.destroy
    redirect_to customers_url
  end

  def customer_params
    params.require(:customerlist).permit(
      :family_name,
      :given_name,
      :email
      )
  end
end
