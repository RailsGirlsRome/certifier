class CertificatesController < ApplicationController
  def show
    @certificate = Certificate.find(params[:id])
    respond_to do |format|
      format.html do
        @certificate_html = certificate_html
      end
      format.pdf do
        kit = PDFKit.new(certificate_html)
        filename = "#{@certificate.name.parameterize}.pdf"
        send_data kit.to_pdf, :filename => filename, :content_type => 'application/pdf'
      end
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

  private

  def certificate_html
    template = ERB.new File.read(Rails.root.join('app/views/certificates/example.html.erb'))
    template.result(binding)
  end
end
