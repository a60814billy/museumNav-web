module Api
  class ActivityController < ApplicationController

    def all
      render :json => Activity.all.to_json
    end

  end
end


