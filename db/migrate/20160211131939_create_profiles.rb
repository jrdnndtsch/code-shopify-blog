class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :website_url
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
