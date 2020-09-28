class User < ApplicationRecord #deviseで利用する機能が記述されている
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable, #「:」の後ろがdeviseの機能名
           :recoverable, :rememberable, :validatable

    #「dependent: :destroy」は、has_manyで使えるオプション
    has_many :post_images, dependent: :destroy #has_manyの後は、1:Nの関係になるモデル名を複数形で記述
    has_many :post_comments, dependent: :destroy #Userのデータを削除したら、Userが投稿したコメントデータも削除される設定。
end
