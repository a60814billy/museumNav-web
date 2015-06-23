class Api::ExhibitController < ApplicationController

  def get
    render :json => Activity.find(params[:id]).exhibits
  end

end
