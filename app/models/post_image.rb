class PostImage < ApplicationRecord
    belongs_to :user #PostImageモデルに関連付けられるのは、1つのUserモデル
    attachment :image #_idは含めない
    has_many :post_comments, dependent: :destroy #投稿画像が削除されたら、コメントも削除される設定。
    has_many :favorites, dependent: :destroy #投稿画像が削除されたら、いいねも削除される設定。

    validates :shop_name, presence: true #バリデーション「ショップ名必須」
    validates :image, presence: true #バリデーション「投稿画像必須」

    def favorited_by?(user) #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
        favorites.where(user_id: user.id).exists?
    end
end
