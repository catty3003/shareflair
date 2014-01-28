class UsersController < ApplicationController
  before_action :set_user, only: [:profile]
  
  def all_user
    

     if params[:sorting]
      @users =User.all.order(params[:sorting] => :asc)
    else 
      
      @users =User.all.order(created_at: :desc)
    end
  end


  def profile
    
  end
  

  private
    def set_user
       @user = User.find(params[:id])
    end

  

end
