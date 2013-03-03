class Upload < ActiveRecord::Base
  has_attached_file :mod_jar
  attr_accessible :mod_jar

  validates_attachment :mod_jar, :presence => true,
    :content_type => { :content_type => ["application/java-archive", "application/zip"] }
end
