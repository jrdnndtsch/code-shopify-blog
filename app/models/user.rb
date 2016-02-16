class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_posts
  has_one :profile

  scope :is_published?   , -> () {
    blog_posts.present?
  }

  def is_published?
    self.blog_posts.present?
  end
end
