module PostDecorator
  def first_iframe
    case first_url
    when /docs\.google\.com/
      %(<iframe src="#{first_url}" frameborder="0" width="1280" height="749" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>).html_safe
    when /youtube\.com/
      %(<iframe width="560" height="315" src="#{first_url}" frameborder="0" gesture="media" allowfullscreen></iframe>).html_safe
    end
  end
end
