class PostImage < ApplicationRecord
    belongs_to :user #PostImageモデルに関連付けられるのは、1つのUserモデル
    attachment :image #_idは含めないも
end
