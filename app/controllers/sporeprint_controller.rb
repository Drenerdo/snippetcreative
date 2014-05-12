class SporeprintController < ApplicationController
	before_filter :set_snips_per_page

	def show
		@total_snips = get_original_project(params[:id].to_i).find_related_tags
		# The array count dosen't work at the moment... I will fix this problem later on
		x = 0
		@total_snips.each do |f|
			x += 1
		end

		@total_users = (x.to_f / @snips_per_user.to_f).ceil

		if params[:offset]
			@offset = Integer(params[:offset]) + 1
			limit_num = (Integer(params[:offset]) + 1) * @snips_per_user
		else
			limit_num = @snips_per_user
		end

		@offset ||= 1

		@snips = find_related_snips(params[:id].to_i, limit_num)
		render 'snips/show'
	end

	def load_more
		offset = @snips_per_user * Integer(params[:offset])
		project_id = params[:snip_id].to_i
		@snips = find_related_snips(snip_id, @snips_per_user, offset)

		respond_to do |format|
			format.html { render :partial => 'users/more_snips' }
			format.js
		end
	end

	private

	def get_original_snip(snip_id)
		@original_snip = Snip.find(snip_id)
	end

	def set_snip_per_user
		@snips_per_user = 20
	end

	def find_related_snips(snip_id, limit_num, offset = 0)
		@related_snips = get_original_snip(snip_id).find_related_tags.limit(limit_num).offset(offset)
	end
end
