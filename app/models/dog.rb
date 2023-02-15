class Dog < ApplicationRecord
    belongs_to :user
    has_many :tag_map2s, dependent: :destroy
  has_many :tags, through: :tag_map2s
    mount_uploader :image, ImageUploader
    has_many :likes, dependent: :destroy
    has_many :liked_users, through: :likes, source: :user
    has_many :comments, dependent: :destroy
    def save_tag(sent_tags)
      current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
      old_tags = current_tags - sent_tags
      new_tags = sent_tags - current_tags
 
      old_tags.each do |old|
        self.tags.delete Tag.find_by(tag_name: old)
      end
 
      new_tags.each do |new|
        new_dog_tag = Tag.find_or_create_by(tag_name: new)
        self.tags << new_dog_tag
      end
    end
end
