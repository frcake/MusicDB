class RecordLibrariesController < ApplicationController
  before_action :set_record_library, only: %i[show edit update destroy]

  # GET /record_libraries
  # GET /record_libraries.json
  def index
    @record_libraries = RecordLibrary.all
  end

  # GET /record_libraries/1
  # GET /record_libraries/1.json
  def show; end

  # GET /record_libraries/new
  def new
    @record_library = RecordLibrary.new
  end

  # GET /record_libraries/1/edit
  def edit; end

  # POST /record_libraries
  # POST /record_libraries.json
  def create
    @record_library = current_user.record_libraries.build(album_id: params[:album_id]) # RecordLibrary.new(record_library_params)

    if @record_library.save
      flash[:notice] = 'Album was added to your library'
      redirect_to root_path
    else
      flash[:notice] = 'Album failed to add to your library'
      redirect_to root_path
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
    # @record_library = current_user.record_library.where(user_id: current_user.id, album_id: params[:id]).destroy
    @record_library.destroy
    flash[:notice] = 'Successfully removed from your library!'
    redirect_to root_path
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
