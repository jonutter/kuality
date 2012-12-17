class ToDoList < BasePage

  header_elements

  element(:list_toggle) { |b| b.link(data_original_title: "Calendar") }
  element(:calendar_toggle) { |b| b.link(data_original_title: "List") }
  element(:todo_list) { |b| b.div(class: "js-todo-list todo-list-body pull-left") }
  element(:loading_div) { |b| b.div(class: "loading") }
  #element(:pending_item_count) { |b| b.unk(unk: "unk") }

  def items
    items = []
    self.divs(class: "pull-right todo-title").each do |div|
      items << div.h4.text
    end
    items
  end

end

class Home < ToDoList

end