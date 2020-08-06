class ApplicationController < ActionController::Base
  #before_action :authenticate_user! ログインしてないユーザーをサインアップ画面へ促す
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
      keys: [:nickname, :first_name, :last_name, :first_name_kana, :last_name_kana, :birth_date])
  end
end