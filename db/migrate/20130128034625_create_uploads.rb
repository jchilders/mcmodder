class CreateUploads < ActiveRecord::Migration
  def change
    create_table :uploads do |t|
      t.string :orig_filename
      t.string :new_filename

      t.timestamps
    end
  end
end
