class ApplicationController < ActionController::API
	def render_resource resource
		return head 404 if resource.nil?
		if resource.errors.empty?
			render json: {resource: resource}, status: 200
		else
			render json: {errors: resource.errors},status: 422
		end
	end
end
