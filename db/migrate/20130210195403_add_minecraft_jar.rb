class AddMinecraftJar < ActiveRecord::Migration
  def up
    add_attachment :uploads, :minecraft_jar
  end

  def down
    remove_attachment :uploads, :minecraft_jar
  end
end
