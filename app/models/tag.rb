class Tag < ApplicationRecord
    belongs_to :user, foreign_key: :id_user

    validates :name, presence: true, uniqueness: { scope: :user }
end
