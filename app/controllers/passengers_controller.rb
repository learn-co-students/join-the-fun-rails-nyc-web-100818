class PassengersController < ApplicationController

  before_action :find_passenger, only: [:show, :edit, :update, :destroy]

  def index
    @passengers = Passenger.all
  end

  def new #form!
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)
    if @passenger.save
      flash[:notice] = "Passenger was successfully added!" #go to view/layout/application, then bad_song#new.erb!
      redirect_to @song
    else
      render 'new' # DO YOU NEED render HERE?!
    end

  end

  def show
    #find_song
  end

  def edit #/bad_song/:id/edit => form
    #find_song
  end

  def update #update bad_song = in action#update !
    #find_article
    if @passenger.update(passenger_params)
      flash[:notice] = "Article was successfully updated!" #go to view/layout/application, then bad_passenger#new.erb!
      redirect_to @passenger
    else
      render 'edit'
    end
  end
  #then make edit template => edit.erb


  def destroy
    # find_article
    @passenger.destroy #or @article.destroy?
    redirect_to passenger_path
    end

  private

  def passenger_params
    params.require(:passenger.permit(:name, :artist_id)
  end
  #require: bad passenger as nested hash in form! (refers to MODEL NAME)

  def find_passenger
    @passenger = Passenger.find_by(id: params[:id])
  end


end #/> class
