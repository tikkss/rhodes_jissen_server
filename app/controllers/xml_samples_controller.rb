require "rexml/document"

class XmlSamplesController < ApplicationController
  include REXML
  
  # GET /xml_samples
  # GET /xml_samples.json
  def index
    @xml_samples = XmlSample.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @xml_samples }
      format.xml  { render xml:  @xml_samples }
    end
  end

  # GET /xml_samples/1
  # GET /xml_samples/1.json
  def show
    @xml_sample = XmlSample.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @xml_sample }
    end
  end

  # GET /xml_samples/new
  # GET /xml_samples/new.json
  def new
    @xml_sample = XmlSample.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @xml_sample }
    end
  end

  # GET /xml_samples/1/edit
  def edit
    @xml_sample = XmlSample.find(params[:id])
  end

  # POST /xml_samples
  # POST /xml_samples.json
  def create
    respond_to do |format|
      format.html do
        @xml_sample = XmlSample.new(params[:xml_sample])
        if @xml_sample.save
          redirect_to @xml_sample, notice: 'Xml sample was successfully created.'
        else
          render action: "new"
        end
      end
      format.xml do
        rexml = REXML::Document.new(params["xml"])
        attr = Hash.from_xml(rexml.to_s)
        @xml_sample = XmlSample.new(attr["xmlsample"])
        if @xml_sample.save
          xml = {msg: "complete", status: "OK"}.to_xml
        else
          xml = {msg: "failed", status: "NG"}.to_xml
        end
        return render xml: xml
      end
    end
  end

  # PUT /xml_samples/1
  # PUT /xml_samples/1.json
  def update
    @xml_sample = XmlSample.find(params[:id])
    
    respond_to do |format|
      format.html do
        @xml_sample = XmlSample.update_attributes(params[:xml_sample])
        if @xml_sample.save
          return redirect_to @xml_sample, notice: 'Xml sample was successfully updated.'
        else
          return render action: "new"
        end
      end
      format.xml do
        rexml = REXML::Document.new(params["xml"])
        attr = Hash.from_xml(rexml.to_s)
        if @xml_sample.update_attributes(attr["xmlsample"])
          xml = {msg: "complete", status: "OK"}.to_xml
        else
          xml = {msg: "failed", status: "NG"}.to_xml
        end
        return render xml: xml
      end
    end
  end

  # DELETE /xml_samples/1
  # DELETE /xml_samples/1.json
  def destroy
    @xml_sample = XmlSample.find(params[:id])
    @xml_sample.destroy

    respond_to do |format|
      format.html { redirect_to xml_samples_url }
      format.xml do
        xml = {msg: "complete", status: "OK"}.to_xml
        return render xml: xml
      end
    end
  end
end
