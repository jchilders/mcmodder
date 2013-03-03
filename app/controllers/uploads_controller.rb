class UploadsController < ApplicationController
  MC_JAR = "#{Rails.root}/public/minecraft.jar"

  # GET /uploads
  # GET /uploads.json
  def index
    @uploads = Upload.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @uploads }
    end
  end

  # GET /uploads/1
  # GET /uploads/1.json
  def show
    @upload = Upload.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/new
  # GET /uploads/new.json
  def new
    @upload = Upload.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @upload }
    end
  end

  # GET /uploads/1/edit
  def edit
    @upload = Upload.find(params[:id])
  end

  # POST /uploads
  # POST /uploads.json
  def create
    @upload = Upload.new
    @upload.update_attributes(:mod_jar => params[:upload][:mod_jar])

    respond_to do |format|
      if @upload.save
        format.html { redirect_to @upload, notice: 'Upload was successfully created.' }
        format.json { render json: @upload, status: :created, location: @upload }
      else
        format.html { render action: "new" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /uploads/1
  # PUT /uploads/1.json
  def update
    @upload = Upload.find(params[:id])

    respond_to do |format|
      if @upload.update_attributes(params[:upload])
        format.html { redirect_to @upload, notice: 'Upload was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @upload.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /uploads/1
  # DELETE /uploads/1.json
  def destroy
    @upload = Upload.find(params[:id])
    @upload.destroy

    respond_to do |format|
      format.html { redirect_to uploads_url }
      format.json { head :no_content }
    end
  end

  def combine
    @upload = Upload.find(params[:id])
    if (!@upload.tempdir)
      @tmpdir = "public/temp/#{rand(36**15).to_s(36)}"
      @upload.tempdir = @tmpdir
      @upload.save
    end

    @tmpdir = @upload.tempdir

    if (!File.exists?(@tmpdir))
      Dir::mkdir(@tmpdir)
    end

    # Clean the temp directory
    FileUtils.rm_rf(Dir.glob(@upload.tempdir + "/*"), :secure => true)
    `unzip #{MC_JAR} -d #{@upload.tempdir}`
    `unzip -o #{@upload.mod_jar.path} -d #{@upload.tempdir}`
    `cd #{@upload.tempdir} && rm -r META-INF && zip --move -r minecraft.jar *`
    send_file "#{@upload.tempdir}/minecraft.jar", :type => 'application/java-archive'
  end

end
