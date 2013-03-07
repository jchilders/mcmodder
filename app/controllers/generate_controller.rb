
class GenerateController < ApplicationController
  def index
    mods = params[:mod]

    # If no mods, just send the unmodified mc.jar
    if (!mods) then
      send_file "#{MC_JAR}", :type => 'application/java-archive' if (!mods) 
      return
    end

    uploads = Upload.find(mods)

    # Create the temp dir
    tmpdir = "public/temp/#{rand(36**15).to_s(36)}"
    if (!File.exists?(tmpdir))
      Dir::mkdir(tmpdir)
    end

    # Clean it temp directory, just in case
    FileUtils.rm_rf(Dir.glob(tmpdir + "/*"), :secure => true)

    # Unzip the local minecraft.jar file
    `unzip #{MC_JAR} -d #{tmpdir}`
    
    # Unzip each selected mod to the temp directory
    # TODO: Cache this
    uploads.each do |ul|
      `unzip -o #{ul.mod_jar.path} -d #{tmpdir}`
    end
    #  Create the new minecraft.jar
    `cd #{tmpdir} && rm -r META-INF && zip --move -r minecraft.jar *`

    # Send it
    send_file "#{tmpdir}/minecraft.jar", :type => 'application/java-archive'
  end

end
