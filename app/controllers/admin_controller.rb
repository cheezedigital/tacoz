class AdminController < ApplicationController
  before_action :authenticate_user! #provide a global usage for its parent controller. 

end
