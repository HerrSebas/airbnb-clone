class FlatsController < ApplicationController

  def index
    @flats = policy_scope(Flat)
  end

  def show
    @flat = Flat.find(params[:id])
    authorize @flat
    @reviews = Review.where(flat: @flat)
    @review = Review.new
    @review.flat = @flat
    @review.user = current_user
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
    @flat = Flat.find(params[:id])
    authorize @flat
  end

  def update
    @flat = Flat.find(params[:id])
    authorize @flat
    if @flat.update(flat_params)
      redirect_to @flat
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @flat = Flat.find(params[:id])
    authorize @flat
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :location, :price, :description, :capacity, :category, :photo)
  end

end
