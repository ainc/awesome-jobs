class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.references :user, index: true
      t.string :title
      t.string :description
      t.string :url

      t.timestamps
    end
  end
end
