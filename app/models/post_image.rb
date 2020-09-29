class PostImage < ApplicationRecord
    belongs_to :user #PostImageモデルに関連付けられるのは、1つのUserモデル
    attachment :image #_idは含めない
    has_many :post_comments, dependent: :destroy #投稿画像が削除されたら、コメントも削除される設定。
    has_many :favorites, dependent: :destroy #投稿画像が削除されたら、いいねも削除される設定。

    def favorited_by?(user) #引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べる。
        favorites.where(user_id: user.id).exists?
    end
end
