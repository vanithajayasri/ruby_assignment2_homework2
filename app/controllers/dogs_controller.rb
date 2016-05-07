class DogsController < ApplicationController
  def index
      @dogs = Dog.all
  end

  def new
    @dogs = Dog.new
  end

  def show
     @dogs = Dog.find(params[:id])
  end

  def create
     @dogs = Dog.create(params.require(:dog).permit(:name, :age))
    if @dogs.save #If saving the user was successful
      redirect_to @dogs #Go to the show view of the user
    else
      render "new" #Go to the new view for the user
    end
  end
end
