class BlogPost < ActiveRecord::Base

  CATEGORIES = ['Theme', 'App']

  extend FriendlyId
    friendly_id :title, use: :slugged

  has_attached_file :photo, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/

  acts_as_taggable

  belongs_to :user

  scope :by_author, -> (author) {
    where(user: author)
  }

  scope :published?, -> {
    where(published: true)
  }

  scope :by_category, -> (road_map_category) {
    where(road_map_category: road_map_category)
  }


  def belongs_to_current_user?(current_user)
    self.user == current_user
  end

  def author
    "#{self.user.profile.first_name} #{self.user.profile.last_name}"
  end

  def excerpt
    self.content.first(500)
  end

  def self.search(search)
    where("content like ? OR title like ? ", "%#{search}%", "%#{search}%")
  end

end
