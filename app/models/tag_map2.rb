class TagMap2 < ApplicationRecord
  belongs_to :dog
  belongs_to :tag
  validates :dog_id, presence: true
  validates :tag_id, presence: true
end
