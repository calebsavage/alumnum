class StaticController < ApplicationController


def find_by_user
    user_id = params[:id]
    @profile = Profile.find_by :user_id => user_id
end

def index
	@user = User.all
	@searches = SavedSearch.order(count: :desc).limit(5)
	@user_admin = Alum.page(params[:page]).per(15)

	@employer_limit_items = Usertag.page(params[:page]).per(15)
	@seeking = Profile.where(status:"Seeking Employment").count
	@not_seeking = Profile.where(status:"Not Seeking Employment").count

	@usertags = Usertag.all
	@tags = Tag.all
	#@profile = Profile.find_by :user_id => params[:id]

	@featured = Alum.limit(1).order("RANDOM()").first
	@featured_profile = Profile.find_by(:user_id => @featured.id)


end

end
