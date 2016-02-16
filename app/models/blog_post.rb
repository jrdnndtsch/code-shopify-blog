class BlogPost < ActiveRecord::Base

  extend FriendlyId
    friendly_id :title, use: :slugged

  acts_as_taggable

  belongs_to :user

  scope :by_author, -> (author) {
    where(user: author)
  }

  scope :published?, -> {
    where(published: true)
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

end
