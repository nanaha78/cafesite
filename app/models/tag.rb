class Tag < ApplicationRecord
    has_many :tag_map2s, dependent: :destroy, foreign_key: 'tag_id'
  has_many :dogs, through: :tag_map2s
end
