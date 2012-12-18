#
class ToDoList < BasePage

  header_elements

  expected_element :first_todo_item

  element(:list_toggle) { |b| b.link(title: "Calendar") }
  element(:calendar_toggle) { |b| b.link(title: "List") }
  element(:todo_list) { |b| b.div(class: "js-todo-list todo-list-body pull-left") }
  element(:loading_div) { |b| b.div(class: "loading") }
  element(:first_todo_item) { |b| b.div(class: "todo-item-summary") }
  #element(:pending_item_count) { |b| b.unk(unk: "unk") }

  def items
    items = []
    self.divs(class: "pull-right todo-title").each do |div|
      items << div.h4.text
    end
    items
  end

end

# The Home class is an alias for the ToDoList class
class Home < ToDoList; end