class Api::V1::TagsController < ApplicationController
 def create
		render_resource Tag.create! tag_name: params[:tag_name], tag_icon: params[:tag_icon]
 end

	def index
			 tag = Tag.page(params[:page]).per 10
				render json: {resources: tag,pager: {
					page: params[:page],
					per_page: 10,
					count: Tag.count
				}}, status: 200
	end

	def show
		render_resource Tag.find params[:tag_id]
	end

end
