#
class ToDoList < BasePage

  header_elements

  expected_element :first_todo_item

  element(:list_toggle) { |b| b.link(title: "Calendar") }
  element(:calendar_toggle) { |b| b.link(title: "List") }
  element(:todo_list) { |b| b.div(class: "js-todo-list todo-list-body pull-left") }
  element(:loading_div) { |b| b.div(class: "loading") }
  element(:first_todo_item) { |b| b.li(class: /^todo-item.*first$/) }
  element(:last_todo_item) { |b| b.li(class: /^todo-item.*last$/) }
  #element(:pending_item_count) { |b| b.unk(unk: "unk") }

  action(:scroll_to_top) { |p| p.first_todo_item.hover }
  action(:load_more_items) { |p| p.last_todo_item.hover; p.loading }

  action(:click_item) { |title, p| p.target_li(title).click }
  action(:item_label) { |title, p| p.target_li(title).span(class: /^label/).text }

  def items
    items = []
    self.divs(class: "pull-right todo-title").each do |div|
      items << div.h4.text
    end
    items
  end

  private

  action(:target_li) { |title, b| b.h4(class: "header", text: title).parent.parent }

end

# The Home class is an alias for the ToDoList class
class Home < ToDoList; end