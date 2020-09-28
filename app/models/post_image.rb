class PostImage < ApplicationRecord
    belongs_to :user #PostImageモデルに関連付けられるのは、1つのUserモデル
    attachment :image # ここを追加（_idは含めません）
end
