class CreateWatchings < ActiveRecord::Migration
  def change
    create_table :watchings do |t|
      t.references :user, index: true
      t.references :job, index: true

      t.timestamps
    end
  end
end
