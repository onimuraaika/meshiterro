class PostComment < ApplicationRecord
    #UserモデルもPostImageモデルも関連付けられるのは1つのため、belongs_toを記述
    belongs_to :user
    belongs_to :post_image
end
