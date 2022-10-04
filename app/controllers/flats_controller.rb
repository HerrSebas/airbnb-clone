class FlatsController < ApplicationController

  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat
    if @flat.save
      redirect_to @flat
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @flat
  end

  def update
    authorize @flat
  end

  def destroy
    authorize @flat
  end
  private

  def flat_params
    params.require(:flat).permit(:title, :location, :price, :description, :capacity, :category, :photo)
  end
end
