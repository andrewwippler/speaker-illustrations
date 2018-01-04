class IllustrationsController < ApplicationController
  before_action :set_illustration, only: [:show, :edit, :update, :destroy]
  before_action :all_tags, only: [:show, :edit]

  # GET /illustrations
  # GET /illustrations.json
  def index
    @illustrations = Illustration.all
  end

  # GET /illustrations/1
  # GET /illustrations/1.json
  def show
    @places = Place.all.order(:used).where('illustration_id = ?', @illustration.id)
  end

  # GET /illustrations/search?q=
  def search
    @q = params[:q]
    @search_results = []
    search_res = Illustration.order(:title)
    search_res = search_res.where('title LIKE ? OR content LIKE ?', "%#{@q}%", "%#{@q}%")

    search_res.each do |sr|
      sr.content = sr.content[0..250].gsub(/\s\w+\s*$/,'...').gsub(/#{@q}/i, "<b>#{@q}</b>")
      @search_results << sr
    end
  end

  # GET /illustrations/new
  def new
    @illustration = Illustration.new
    @tagValue = ''
  end

  # GET /illustrations/1/edit
  def edit
    @tagValue = @tags.join(', ')
  end

  # POST /illustrations
  # POST /illustrations.json
  def create
    @illustration = Illustration.new(illustration_params)

    respond_to do |format|
      if @illustration.save
        params[:illustration][:tags].split(/\s*,\s*/).each do |t|
          @illustration.tags << Tag.find_or_create_by(name: t) 
        end
        format.html { redirect_to @illustration, notice: 'Illustration was successfully created.' }
        format.json { render :show, status: :created, location: @illustration }
      else
        format.html { render :new }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /illustrations/1
  # PATCH/PUT /illustrations/1.json
  def update
    respond_to do |format|
      if @illustration.update(illustration_params)
        @illustration.tags.clear unless params[:illustration][:tags].empty? # empty tags make the illustration invisible
        params[:illustration][:tags].split(/\s*,\s*/).each do |t|
          @illustration.tags << Tag.find_or_create_by(name: t)
        end
        format.html { redirect_to @illustration, notice: 'Illustration was successfully updated.' }
        format.json { render :show, status: :ok, location: @illustration }
      else
        format.html { render :edit }
        format.json { render json: @illustration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /illustrations/1
  # DELETE /illustrations/1.json
  def destroy
    @illustration.tags.clear
    @illustration.delete
    respond_to do |format|
      format.html { redirect_to tags_url, notice: 'Illustration was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_illustration
    @illustration = Illustration.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def illustration_params
    params.require(:illustration).permit(:title, :author, :source, :content)
  end

  def all_tags
    @tags = []
    @tag_links = []
    @illustration.tags.each do |t|
      @tags << t.name
      @tag_links << t
    end
  end
end
