class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if params [:file].present?
      req = Cloudinary::Uploader.upload params[:file]
      @user.profile_pic = req["public_id"]
      @user.save
      # if @user.save
        session[:user_id] = @user.id
        redirect_to whistles_path # Sign up was successful
      # else
      #   render :new
      # end
    end
  end

  def show
    @user = User.find params[:id]
    @relationship = Relationship.all
  end

  def relationships
    @user = User.find params[:id]

    Relationship.create :follower_id => @current_user.id, :followed_id => @user.id
    redirect_to user_path(@user)
  end

  def destroy_relationship
    @user = User.find params[:id]
    r = Relationship.where :follower_id => @current_user.id, :followed_id => @user.id
    r.first.destroy
    redirect_to user_path(@user)
  end

  def edit
    @user = @current_user
    # @user = User.find params[:id]
  end

  def update
    # @user = @current_user
    @user = User.find params[:id]
    if params [:file].present?
      req = Cloudinary::Uploader.upload params[:file]
      user.profile_pic = req["public_id"]
    end
    @user.update_attributes user_params
    @user.save
    if @user.update(user_params)
      flash[:message] = 'Profile successfully updated'
      redirect_to @user
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :username, :name, :password, :password_confirmation, :profile_pic)
  end
end
