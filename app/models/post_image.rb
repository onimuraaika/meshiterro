class PostImage < ApplicationRecord
    belongs_to :user #PostImageモデルに関連付けられるのは、1つのUserモデル
    attachment :image #_idは含めない
    has_many :post_comments, dependent: :destroy #投稿画像が削除されたら、コメントも削除される設定。
end
