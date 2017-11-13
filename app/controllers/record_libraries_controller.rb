class RecordLibrariesController < ApplicationController
  before_action :set_record_library, only: [:show, :edit, :update, :destroy]

  # GET /record_libraries
  # GET /record_libraries.json
  def index
    @record_libraries = RecordLibrary.all
  end

  # GET /record_libraries/1
  # GET /record_libraries/1.json
  def show
  end

  # GET /record_libraries/new
  def new
    @record_library = RecordLibrary.new
  end

  # GET /record_libraries/1/edit
  def edit
  end

  # POST /record_libraries
  # POST /record_libraries.json
  def create
    @record_library = RecordLibrary.new(record_library_params)

    respond_to do |format|
      if @record_library.save
        format.html { redirect_to @record_library, notice: 'Record library was successfully created.' }
        format.json { render :show, status: :created, location: @record_library }
      else
        format.html { render :new }
        format.json { render json: @record_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /record_libraries/1
  # PATCH/PUT /record_libraries/1.json
  def update
    respond_to do |format|
      if @record_library.update(record_library_params)
        format.html { redirect_to @record_library, notice: 'Record library was successfully updated.' }
        format.json { render :show, status: :ok, location: @record_library }
      else
        format.html { render :edit }
        format.json { render json: @record_library.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /record_libraries/1
  # DELETE /record_libraries/1.json
  def destroy
    @record_library.destroy
    respond_to do |format|
      format.html { redirect_to record_libraries_url, notice: 'Record library was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_record_library
      @record_library = RecordLibrary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def record_library_params
      params.require(:record_library).permit(:user_id, :album_id)
    end
end
