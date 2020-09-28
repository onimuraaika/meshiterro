class ApplicationController < ActionController::Base
    before_action :authenticate_user! #全てのページで認証が必要になる
    before_action :configure_permitted_parameters, if: :devise_controller?
    #devise利用の機能(ユーザ登録/ログイン認証等)が使われる場合、その前にconfigure_permitted_parametersが実行される

    protected

    def configure_permitted_parameters #devise_parameter_sanitizer.permitでnameのデータ操作を許可するアクションメソッドが指定されている
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
