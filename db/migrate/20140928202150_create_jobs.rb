class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.references :user, index: true
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
