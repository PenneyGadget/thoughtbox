class Api::V1::LinksController < Api::V1::BaseController
  respond_to :json

  def update
    respond_with Link.update(params[:id], link_params)
  end

  private

  def link_params
    params.permit(:read)
  end

end
