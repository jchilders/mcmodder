class RemoveMinecraftJarFromUploads < ActiveRecord::Migration
  def up
    remove_attachment :uploads, :minecraft_jar
  end

  def down
    add_attachment :uploads, :minecraft_jar
  end
end
