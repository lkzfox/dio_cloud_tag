class Content < ApplicationRecord
    belongs_to :user, foreign_key: 'id_user'

    validates :title, :description, presence: true
end
