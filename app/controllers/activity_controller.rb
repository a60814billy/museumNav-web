require 'rqrcode_png'

class ActivityController < ApplicationController

  def index
    @activities = Activity.all

    @activities.each do |a|
      if a.ticket_auth_code
        a.qrcode = RQRCode::QRCode.new(a.ticket_auth_code).to_img.resize(500,500).to_data_url
      end

    end

  end

  def new
    @activity = Activity.new
  end

  def create

    @activity = Activity.new(activity_params)

    if params[:activity].has_key? :pic
      pic = params[:activity][:pic]
      extname = File.extname(pic.original_filename)
      directory = "public/image"
      file_name = SecureRandom.uuid + extname
      path = File.join(directory, file_name)
      File.open(path, "wb") { |f| f.write(pic.read) }
      @activity.pic = file_name
    end

    if params[:activity].has_key? :ticket_type
      if params[:activity][:ticket_type] == '1'
        @activity.ticket_auth_code = SecureRandom.uuid
      end
    end

    @activity.save
    redirect_to :action => :index
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    @activity.update(activity_params)

    redirect_to :action => :show, :id => @activity
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to :action => :index
  end


  private

  def activity_params
    params.require(:activity).permit(:title,:description,:start_date,:end_date,:ticket_type)
  end

end
