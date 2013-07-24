require 'fileutils'

class JsonSamplesController < ApplicationController
  # GET /json_samples
  # GET /json_samples.json
  def index
    @json_samples = JsonSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @json_samples }
    end
  end

  # GET /json_samples/1
  # GET /json_samples/1.json
  def show
    @json_sample = JsonSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @json_sample }
    end
  end

  # GET /json_samples/new
  # GET /json_samples/new.json
  def new
    @json_sample = JsonSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @json_sample }
    end
  end

  # GET /json_samples/1/edit
  def edit
    @json_sample = JsonSample.find(params[:id])
  end

  # POST /json_samples
  # POST /json_samples.json
  def create
    respond_to do |format|
      format.html do
        @json_sample = JsonSample.new(params[:json_sample])
        if @json_sample.save
          redirect_to @json_sample, notice: 'Json sample was successfully created.'
        else
          render action: "new"
        end
      end
      format.json do
        @json_sample = JsonSample.new(JSON.parse(params["json"]))
        if @json_sample.save
          json = {msg: "complete", status: "OK"}
        else
          json = {msg: "failed", status: "NG"}
        end
        return render json: json
      end
    end
  end

  # PUT /json_samples/1
  # PUT /json_samples/1.json
  def update
    @json_sample = JsonSample.find(params[:id])

    respond_to do |format|
      format.html do
        if @json_sample.update_attributes(params[:json_sample])
          redirect_to @json_sample, notice: 'Json sample was successfully updated.'
        else
          render action: "edit"
        end
      end
      format.json do
        if @json_sample.update_attributes(JSON.parse(params["json"]))
          json = {msg: "complete", status: "OK"}
        else
          json = {msg: "failed", status: "NG"}
        end
        render json: json
      end
    end
  end

  # DELETE /json_samples/1
  # DELETE /json_samples/1.json
  def destroy
    @json_sample = JsonSample.find(params[:id])
    @json_sample.destroy

    respond_to do |format|
      format.html { redirect_to json_samples_url }
      format.json { render json: {msg: "complete", status: "OK"} }
    end
  end
  
  def upload
    @json_sample = JsonSample.find(params[:id])
    respond_to do |format|
      format.json do
        begin
          upload_dir_path = File.join(Rails.root, "files", "json_samples", @json_sample.id.to_s)
          FileUtils.mkdir_p(upload_dir_path)
          File.open(File.join(upload_dir_path, "image.png"), "wb") do |f|
            f.write params[:file_path].read
          end
          return render json: {status: "OK", msg: "complete"}
        rescue
          return render json: {status: "NG", msg: "failed"}
        end
      end
    end
  end
end
