class Tag < ApplicationRecord
    belongs_to :user, foreign_key: :id_user

    has_many :tag_contents, foreign_key: :id_tag, dependent: :destroy
    has_many :contents, through: :tag_contents

    validates :name, presence: true, uniqueness: { scope: :user }
end
