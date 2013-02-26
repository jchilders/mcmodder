class AddTempdirToUpload < ActiveRecord::Migration
  def change
    add_column :uploads, :tempdir, :string
  end
end
