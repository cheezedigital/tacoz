class SearchResultsController < ApplicationController

   def index
    # @menu_items = MenuItem.search(params[:q])
    # @locations = Location.search(params[:q])
      @results = PgSearch.multisearch(params[:id]).collect(&:searchable) 
   end

end
