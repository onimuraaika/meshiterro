class User < ApplicationRecord #deviseで利用する機能が記述されている
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, #「:」の後ろがdeviseの機能名
         :recoverable, :rememberable, :validatable
end
