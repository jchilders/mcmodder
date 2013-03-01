class AddModJar < ActiveRecord::Migration
  def change
    add_attachment :uploads, :mod_jar
  end
end
