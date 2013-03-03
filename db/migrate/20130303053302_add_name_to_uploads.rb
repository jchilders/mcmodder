class AddNameToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :name, :string
  end
end
