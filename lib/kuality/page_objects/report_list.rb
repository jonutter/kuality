class ReportList < BasePage

  header_elements

  def reports
    reports = []
    self.links(class: "lightbox_trigger").each { |link| reports << link.text }
    reports
  end

end