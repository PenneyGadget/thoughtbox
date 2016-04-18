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
      flash.now[:error] = "Invalid Link"
      @links = current_user.links.select{ |link| !link.id.nil? }
      render :index
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @link = Link.find(params[:id])
    if @link.update(link_params)
      flash[:notice] = "Link made MORE BETTER!"
      redirect_to links_path
    else
      flash.now[:error] = "Must have title and url"
      render :edit
    end
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end

end
