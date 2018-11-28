class SearchedsController < ApplicationController
before_action :set_searched, only: [:show, :edit, :update, :destroy]
after_action :set_authorize, only: [:show, :new, :edit, :update, :destroy]

 def index
   @searcheds = policy_scope(Searched).order(created_at: :desc)
 end

 def show
  @searched = Searched.find(params[:id])
 end

 def new
   @searched = Searched.new
 end

 def create
   rest = Searched.new(searched_params)
   rest.user = current_user
   authorize rest
   rest.save
   redirect_to searcheds_path(rest)
 end

 def edit

 end

 def update
   @searched = Searched.find(params[:id])
   @searched.update(searched_params)
   redirect_to searched_path(@searched)
 end

 def destroy
   @searched.destroy
   redirect_to searcheds_path
 end

 private

 def searched_params
   params.require(:searched).permit(:keyword, :location)
 end

 def set_searched
   @searched = Searched.find(params[:id])
 end
 def set_authorize
  authorize @searched
 end

end
