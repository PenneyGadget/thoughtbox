class LinksController < ApplicationController

  def index
    @links = current_user.links
  end

  def new
    @link = Link.new
  end

  def create
    @link = current_user.links.new(link_params)
    if @link.save
      flash[:notice] = "New link saved!"
      redirect_to links_path
    else
      flash[:error] = "Invalid Link"
      @links = current_user.links
      render :index
    end
  end

  def edit
    @link = Link.find(params["id"])
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
