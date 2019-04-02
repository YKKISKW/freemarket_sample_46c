class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @profile = SocialProfile.where(provider: session[:provider], uid: session[:uid]).new
    @profile.user = current_user || User.create(sns_sign_up)
    @profile.save!
    redirect_to new_user_session_path
  end

  def top

    
  end

  def mypage
  end

  def profile
  end

  def userconfirm
  end

  def userlogout
  end

  def credit
  end

  def creditregistration
  end

  def itemsell
  end


  def itemconfirm
  end

  def sign_up
  end

  private

  def sns_sign_up
    params.permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:birthday).merge(nickname: session[:nickname],email: session[:email], password: session[:password])
  end



end
