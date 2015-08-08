class WelcomeController < ApplicationController
	layout false, :only => :hello
	def index 
	end

	def hello
	end

	def more
		Rails.logger.info '==============='
		Rails.logger.info params.inspect
		Rails.logger.info '==============='
		render json:{hello:'你好世界'}
	end

	def upload
		avatars = []
		params[:files].each do |file|
			avatar = AvatarUploader.new
			avatar.store!(file)
			avatars << avatar.url
		end
		render json:{files:avatars}
	end
end
