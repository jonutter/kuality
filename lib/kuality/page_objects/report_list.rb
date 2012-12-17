class ReportList < BasePage

  header_elements

  page_url "#{$base_url}/reports"

  element @browser.button(class: "lightbox-trigger btn btn-link")

  def reports
    reports = []
    self.buttons(class: "lightbox-trigger btn btn-link").each { |link| reports << link.text }
    reports
  end

  action(:open) { |report, b| b.button(text: report).click; b.loading }

end