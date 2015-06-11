class AuthorSessionsController < ApplicationController
  def new
  end
  
  def create
    if login(params[:email], params[:password])
      redirect_back_or_to(articles_path, notice: 'Successfully Logged in')
    else
      flash.now.alert = 'Failed to Login'
      render action: :new
    end
  end
  
  def destroy
    logout
    redirect_to(:authors, notice: 'Logged out!')
  end
end
