class ReportsBase < BasePage

  header_elements

  element(:jrvi) { |b| b.frame(id: "jasper-report-viewer-iframe") }
  action(:report_loading) { |b| b.jrvi.div(id: "loading").wait_while_present }

end