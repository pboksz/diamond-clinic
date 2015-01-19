module ApplicationHelper
  def readmore(text)
    if text.length > 400
      content_tag :div, truncated(text) + expanded(text), class: :readmore
    else
      simple_format(text)
    end
  end

  private

  def truncated(text)
    toggleable_tag(text_tag(truncate(text, length: 400)) + link_tag(:more))
  end

  def expanded(text)
    toggleable_tag(text_tag(text) + link_tag(:less), style: 'display: none')
  end

  def toggleable_tag(content, options = {})
    content_tag :div, content, class: :toggleable, style: options[:style]
  end

  def text_tag(text)
    content_tag :div, text
  end

  def link_tag(type)
    content_tag :a, I18n.t("views.readmore.#{type}"), class: "toggle #{type}"
  end
end
