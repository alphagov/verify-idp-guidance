require 'govuk_tech_docs'

GovukTechDocs::SourceUrls.class_eval do
  def report_issue_url
    'mailto:idasupport@digital.cabinet-office.gov.uk'
  end
end

ready do
  sitemap.resources
         .map(&:path)
         .select { |path| path.end_with?('.html') }
         .each { |page| redirect page, to: config[:tech_docs][:service_link] }
end

GovukTechDocs.configure(self)
