class ApartmentsController < ApplicationController
  before_action :set_apartment, only: %i[show edit update destroy]

  def index
    @apartments = Apartment.order(created_at: :desc)
  end

  def show
  end

  def new
    @apartment = Apartment.new
    2.times { @apartment.stations.build }
  end

  def edit
    @apartment.stations.build
  end

  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      redirect_to @apartment, notice: "物件 #{@apartment.name} を登録しました"
    else
      render :new
    end
  end

  def update
    if @apartment.update(apartment_params)
      redirect_to @apartment, notice: "物件 #{@apartment.name} を更新しました"
    else
      render :edit
    end

  end

  def destroy
  end

  private

  def apartment_params
    params.require(:apartment).permit(
      :name,
      :rent,
      :address,
      :year,
      :remarks,
      stations_attributes: %i[id route name walking_minutes number]
    )
  end

  def set_apartment
    @apartment = Apartment.find(params[:id])
  end
end
