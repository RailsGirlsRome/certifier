class CertificatesController < ApplicationController
  # GET /certificates/1
  # GET /certificates/1.json
  def show
    @certificate = Certificate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @certificate }
    end
  end

  def new
    @certificate = Certificate.new
  end

  def create
    @certificate = Certificate.new(params[:certificate])
    if @certificate.save
      redirect_to @certificate, notice: 'Certificate was successfully created.'
    else
      render action: 'new'
    end
  end
end
