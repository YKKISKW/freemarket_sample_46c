# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook; basic_action; end
  def google; basic_action; end

  private
  def basic_action
    @omniauth = request.env['omniauth.auth']
    if @omniauth.present?
      @profile = SocialProfile.where(provider: @omniauth['provider'], uid: @omniauth['uid']).first

      if @profile
        @profile.set_values(@omniauth)
        sign_in_and_redirect @profile.user, event: :authentication
      else
          session[:nickname] = @omniauth['info']['name']
          session[:email] = @omniauth['info']['email']
          session[:password] = Devise.friendly_token[0, 20]
          session[:provider] = @omniauth['provider']
          session[:uid] = @omniauth['uid']
          redirect_to users_new_path
      end
    end
  end
end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
