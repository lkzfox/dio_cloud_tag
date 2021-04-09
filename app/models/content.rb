class Content < ApplicationRecord
    belongs_to :user, foreign_key: 'id_user'

    has_many :tag_contents, foreign_key: :id_content
    has_many :tags, through: :tag_contents

    validates :title, :description, presence: true
end
