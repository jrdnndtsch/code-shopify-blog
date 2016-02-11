class Profile < ActiveRecord::Base

  has_attached_file :avatar, styles: { small: "200x200>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/


  belongs_to :user
end
