class ReportsBase < BasePage

  header_elements

  element(:jrvi) { |b| b.frame(id: "jasper-report-viewer-iframe") }

  link "Click to close"

end