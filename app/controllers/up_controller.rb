class UpController < ApplicationController
  def index
    @upload = Upload.new
  end

  def upload
    mc_jar = params[:minecraft_jar]
    puts "mc_jar type: #{mc_jar.content_type}"

    if mc_jar.content_type != "application/java-archive"
      puts "-=> mc_jar not of correct type"
      return
    end

    File.open(Rails.root.join('public', 'uploads', mc_jar.original_filename), 'wb') do |file|
      file.write(mc_jar.read)
    end
    puts "--> File uploaded!"
  end
end
