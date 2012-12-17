class ReportList < BasePage

  header_elements

  def reports
    reports = []
    self.links(class: "lightbox_trigger").each { |link| reports << link.text }
    reports
  end

  action(:open) { |report, b| b.link(text: report).click; b.loading }

end