class AboutController < ApplicationController
  def show
    @categories = Category.all
  end
end
