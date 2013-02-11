require 'zip/zip'

class ModdersController < ApplicationController
  def show
    @upload = Upload.find(params[:id])

    mc_jar_path = @upload.minecraft_jar.path
    mod_path = @upload.mod_jar.path
    
    @jar_contents = []

    mc_zip = Zip::ZipFile.new(mc_jar_path)
    Zip::ZipFile.foreach(mod_path) do |zipfile|
      @jar_contents << zipfile
      #mc_zip.add(zipfile, zipfile.to_s)
    end

  end

end
