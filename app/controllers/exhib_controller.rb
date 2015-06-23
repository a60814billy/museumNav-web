class ExhibController < ApplicationController

  def index
    @exhibits = Activity.find(params[:activity_id]).exhibits
  end

  def show
    @exhibit = Activity.find(params[:activity_id]).exhibits.find(params[:id])
  end

  def new
    @exhibit = Activity.find(params[:activity_id]).exhibits.new
  end

  def create
    @exhibit = Activity.find(params[:activity_id]).exhibits.new(exhibit_params)

    if params[:exhibit].has_key? :pic
      pic = params[:exhibit][:pic]
      extname = File.extname(pic.original_filename)
      directory = "public/image"
      file_name = SecureRandom.uuid + extname
      path = File.join(directory, file_name)
      File.open(path, "wb") { |f| f.write(pic.read) }
      @exhibit.pic = file_name
    end

    if params[:exhibit].has_key? :src
      audio = params[:exhibit][:src]
      extname = File.extname(audio.original_filename)
      directory = "public/audio"
      file_name = SecureRandom.uuid + extname
      path = File.join(directory, file_name)
      File.open(path, "wb") { |f| f.write(audio.read) }
      @exhibit.src = file_name
    end

    @exhibit.save
    redirect_to :action => :index, :activity_id => params[:activity_id]
  end

  def edit
    @exhibit = Activity.find(params[:activity_id]).exhibits.find(params[:id])
  end

  def update

  end

  def destroy
    @exhibit = Activity.find(params[:activity_id]).exhibits.find(params[:id])
    @exhibit.destroy
    redirect_to :action => :index
  end

  private

  def exhibit_params
    params.require(:exhibit).permit(:name,:beacon, :activity_id)
  end

end
