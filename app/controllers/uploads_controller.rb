class UploadsController < ApplicationController
	

	def index
		@uploads=Upload.all
	end

	def show 
	end

	def new
 		@upload=Upload.new
 	end


	def create
		
		@upload=Upload.new(upload_params)
		@upload.save
		redirect_to uploads_path, notice: 'Image  was successfully uploaded.' 
  end

  private

  def upload_params
    params.require(:upload).permit(:id,:avatar)
  end
end
