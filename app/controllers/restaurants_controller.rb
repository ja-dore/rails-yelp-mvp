class RestaurantsController < ApplicationController
  before_action :find_resto, only: %i[edit show update destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
    # before action
    @review = Review.new
  end

  def new
    # hier moet wel iets staan om de form_for te kunnen gebruiken
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_tasks)
    if @restaurant.save
      # no need to create a view for create if you redirect!
      redirect_to restaurant_path(@restaurant)
      # redirect_to '/tasks' is similar, but the readability is much bigger
      # the easiness to adapt afterwards aswell
    else
      render :new
    end
  end

  def edit
    # before action
  end

  def update
    @restaurant.update(params_tasks)

    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

  def find_resto
    @restaurant = Restaurant.find(params[:id])
  end

  def params_tasks
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
