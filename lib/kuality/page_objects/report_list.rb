class ReportList < BasePage

  header_elements

  page_url "#{$base_url}/reports"

  expected_element :first_button

  element(:first_button) { |b| b.button(class: "lightbox-trigger btn btn-link") }

  def reports
    reports = []
    self.buttons(class: "lightbox-trigger btn btn-link").each { |link| reports << link.text }
    reports.values_at(reports.each_index.select{|i| i.even?})
  end

  action(:open) { |report, b| b.button(text: report).click; b.loading }

end