class PagesController < ApplicationController
  def home
    @flats = Flat.all
  end

  def profile
  end
end
