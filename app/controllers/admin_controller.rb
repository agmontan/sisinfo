class AdminController < ApplicationController
	def users
    @users = User.all.order(created_at: :desc)
      #authorize! :read, @users
  	end

  	
end
