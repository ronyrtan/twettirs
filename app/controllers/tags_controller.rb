class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def show
    @tag =  ActsAsTaggableOn::Tag.find(params[:id])
    @whistles = Whistle.tagged_with(@tag.name)
    @user = @whistles.each do |f|
      f.user
    end
    render :show
  end
end
