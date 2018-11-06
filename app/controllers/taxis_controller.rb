class TaxisController < ApplicationController

  before_action :find_song, only: [:show, :edit, :update, :destroy]

  def index
    @taxis = Taxi.all
  end

  def new #form!
    @taxi = Taxi.new
  end

  def create
    @taxi = Taxi.new(taxi_params)
    if @taxi.save
      flash[:notice] = "Taxi was successfully added!" #go to view/layout/application, then bad_song#new.erb!
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
    if @taxi.update(taxi_params)
      flash[:notice] = "Article was successfully updated!" #go to view/layout/application, then bad_taxi#new.erb!
      redirect_to @taxi
    else
      render 'edit'
    end
  end
  #then make edit template => edit.erb


  def destroy
    # find_article
    @taxi.destroy #or @article.destroy?
    redirect_to taxi_path
    end

  private

  def taxi_params
    params.require(:taxi.permit(:name, :artist_id)
  end
  #require: bad taxi as nested hash in form! (refers to MODEL NAME)

  def find_taxi
    @taxi = Taxi.find_by(id: params[:id])
  end


end #/> class
