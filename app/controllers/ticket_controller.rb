class TicketController < ApplicationController

  def index
    @tickets = Activity.find(params[:activity_id]).tickets.paginate(:page => params[:page], :per_page => 5)
    @tickets.each do |t|
      puts "test"
      t.qrcode = RQRCode::QRCode.new(t.ticket_authentication_code).to_img.resize(500,500).to_data_url
    end
  end

  def show
    @ticket = Activity.find(params[:activity_id]).tickets.find(params[:id])
  end

  def new
    @ticket = Activity.find(params[:activity_id]).tickets.new
  end

  def create
    n =  params[:n].to_i
    for i in 1..n
      @ticket = Activity.find(params[:activity_id]).tickets.create({ ticket_authentication_code: SecureRandom.uuid })
    end
    redirect_to :action => :index
  end

  def edit

  end

  def update

  end

  def destroy
    @ticket = Activity.find(params[:activity_id]).tickets.find(params[:id])
  end

end
