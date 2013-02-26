class Upload < ActiveRecord::Base
  has_attached_file :minecraft_jar
  attr_accessible :minecraft_jar

  has_attached_file :mod_jar
  attr_accessible :mod_jar

  validates_attachment :minecraft_jar, :presence => false,
    :content_type => { :content_type => "application/java-archive" }
  validates_attachment :mod_jar, :presence => true,
    :content_type => { :content_type => ["application/java-archive", "application/x-rar", "application/zip"] }
end
