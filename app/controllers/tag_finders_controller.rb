class TagFindersController < ApplicationController
before_action :authenticate_user!, except: [:new, :create, :thank_you, :finder_input]

   def new
    @tag = Tag.find_by(code: params[:code])
    @finder = Finder.new
    # raise
  end

  def create
    @tag = Tag.find_by(id: params[:format])
    @finder = Finder.new(finder_params)
    @finder.tag = @tag
    @finder.save
    # mail = FinderMailer.with(user: @finder.tag.user, finder: @finder, tag: @finder.tag).notification
    # mail.deliver_now
    redirect_to finder_thank_you_path
  end

  def finder_input
  end

  def thank_you
    # @finder = Finder.find(params[:id])
  end

  private

  def finder_params
    params.require(:finder).permit(:phone, :email, :message)
  end
end