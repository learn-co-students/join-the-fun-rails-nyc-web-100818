class RidesController < ApplicationController

  before_action :find_ride, only: [:show, :edit, :update, :destroy]

  def index
    @rides = Ride.all
  end

  def new #form!
    @ride = Ride.new
  end

  def create
    @ride = Ride.new(ride_params)
    if @ride.save
      flash[:notice] = "Ride was successfully added!" #go to view/layout/application, then bad_song#new.erb!
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
    if @ride.update(ride_params)
      flash[:notice] = "Article was successfully updated!" #go to view/layout/application, then bad_ride#new.erb!
      redirect_to @ride
    else
      render 'edit'
    end
  end
  #then make edit template => edit.erb


  def destroy
    # find_article
    @ride.destroy #or @article.destroy?
    redirect_to ride_path
    end

  private

  def ride_params
    params.require(:ride.permit(:name, :artist_id)
  end
  #require: bad ride as nested hash in form! (refers to MODEL NAME)

  def find_ride
    @ride = Ride.find_by(id: params[:id])
  end


end #/> class
