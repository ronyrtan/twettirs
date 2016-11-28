class WhistlesController < ApplicationController

  def index
    @whistles = Whistle.all
  end

  def new
    @whistle = Whistle.new
  end

  def create
    # @whistle = Whistle.new whistle_params
    @whistle = @current_user.whistles.new whistle_params # creates association to current user
    if @whistle.save
      redirect_to whistles_path
    else
      render :new
    end
  end

  def show
    @whistle = Whistle.find params[:id]
  end

  def destroy
    whistle = Whistle.find params[:id]

    ## Stops other users from deleting your post
    redirect_to whistle if whistle.user_id != @current_user.id

    whistle.destroy
    redirect_to whistles_path
  end

  def star
    @whistle = Whistle.find params[:id]
    type = params[:type]
    if type == "star"
      @current_user.stars << @whistle
      redirect_to :back
    elsif type == "unstar"
      @current_user.stars.destroy(@whistle)
      redirect_to :back
    else
      redirect_to :back
    end
  end

  private
  def whistle_params
    params.require(:whistle).permit(:user_id, :post, :posted_at, :star, :create_at, :tag_list)
  end
end
