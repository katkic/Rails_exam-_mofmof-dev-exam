class ApartmentsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @apartment = Apartment.new
    2.times { @apartment.stations.build }
  end

  def edit
  end

  def create
    @apartment = Apartment.new(apartment_params)

    if @apartment.save
      redirect_to @apartment, notice: "物件 #{@apartment.name} を登録しました"
    end
  end

  def update
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

end
