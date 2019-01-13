class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  
  before_action :configure_permitted_parameters, if: :devise_controller?

  protect_from_forgery with: :exception  
  
  def after_sign_out_path_for(resource)
    "/users/sign_in"
  end
  #after_sign_out_for_pathでサインアウト時の動作を指定。devise独自のメソッド。
  #resourceはdevise特有のもので、紐づいてるモデルを取得している？rails g devise userしたならUserモデルからのサインアウトを検知？
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :image])#新規登録のﾀｲﾐﾝｸﾞでnicknameとimageを許可する
    #引数の値	         処理
    #:sign_up	         新規登録時
    #:sign_in	         ログイン時
    #:account_update	レコードの更新時
  end
  
  
end
