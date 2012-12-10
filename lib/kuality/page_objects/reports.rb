class Reports < BasePage

  header_elements

  def reports
    reports = []
    self.links(class: "lightbox_trigger").each { |link| reports << link.text }
    reports
  end

  element(:rvi) { |b| b.frame(id: "jasper-report-viewer-iframe") }

  link "Click to close"

end