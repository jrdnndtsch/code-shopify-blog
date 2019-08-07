class AddAttachmentImageToBlogPhotos < ActiveRecord::Migration[5.1]
  def self.up
    change_table :blog_photos do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :blog_photos, :image
  end
end
