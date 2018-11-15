class WelcomeController < ApplicationController
  skip_before_action :authorized, only: [:index]

  def index
    if current_user
      redirect_to current_user
    else
      render "index"
    end
  end
  
end
