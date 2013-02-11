class RemoveDupeAttrsFromUploads < ActiveRecord::Migration
  def up
    change_table :uploads do |u|
      u.remove :filename, :uploaded_at
    end
  end

  def down
    change_table :uploads do |u|
      u.string :filename
      u.datetime :uploaded_at
    end
  end
end
