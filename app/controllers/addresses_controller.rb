class AddressesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address, only: [ :edit, :update, :destroy ]

  def index
    @addresses = current_user.addresses
  end

  def new
    @address = current_user.addresses.build
    @provinces = Province.all.order(:name)
  end

  def create
    @address = current_user.addresses.build(address_params)
    if @address.save
      redirect_to addresses_path, notice: "Address added successfully."
    else
      @provinces = Province.all.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @provinces = Province.all.order(:name)
  end

  def update
    if @address.update(address_params)
      redirect_to addresses_path, notice: "Address updated successfully."
    else
      @provinces = Province.all.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @address.destroy
    redirect_to addresses_path, notice: "Address removed."
  end

  private

  def set_address
    @address = Address.find(params[:id])
    authorize_address!
  end

  def authorize_address!
    redirect_to addresses_path, alert: "Not authorized" unless @address.user_id == current_user.id
  end

  def address_params
    params.require(:address).permit(:address_line1, :address_line2, :city, :postal_code, :is_default, :province_id)
  end
end
