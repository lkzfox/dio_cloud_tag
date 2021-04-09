class TagContent < ApplicationRecord
    belongs_to :tag, foreign_key: :id_tag
    belongs_to :content, foreign_key: :id_content
end
