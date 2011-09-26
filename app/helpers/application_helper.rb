module ApplicationHelper

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
       render(association.to_s.singularize + "_fields", :f => builder )
    end
    link_to_function(name, "add_fields(this,\"#{association}\",\"#{escape_javascript(fields)}\")")

  end

  def link_to_add_ingredient(name, f)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
       render(association.to_s.singularize + "_fields", :f => builder )
    end
    link_to_function(name, "add_fields(this,\"#{association}\",\"#{escape_javascript(fields)}\")")

  end

  def default_text(text)
     onFocusFunction = "field = event.target || event.srcElement; if (field.value=='#{text}') {field.value = '';}else {return false}"
     onBlurFunction = "field = event.target || event.srcElement; if (field.value=='') {field.value = '#{text}';}else {return false}"
     {:value => text, :onfocus => onFocusFunction, :onblur => onBlurFunction}
  end


end
