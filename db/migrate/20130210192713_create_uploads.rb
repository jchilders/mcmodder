class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :filename
      t.datetime :uploaded_at

      t.timestamps
    end
  end
end
