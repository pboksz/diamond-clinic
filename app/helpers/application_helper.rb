module ApplicationHelper
  def readmore(text, options = {})
    max_length = options[:max_length] || 400

    if text.length > max_length
      content_tag(:div, truncated(text, max_length) + expanded(text), class: :readmore)
    else
      simple_format(text)
    end
  end

  private

  def truncated(text, max_length)
    toggleable_tag(text_tag(truncate(text, length: max_length)) + link_tag(:more))
  end

  def expanded(text)
    toggleable_tag(text_tag(text) + link_tag(:less), style: 'display: none')
  end

  def toggleable_tag(content, options = {})
    content_tag(:div, content, class: :toggleable, style: options[:style])
  end

  def text_tag(text)
    content_tag(:div, text)
  end

  def link_tag(type)
    content_tag(:a, I18n.t("views.readmore.#{type}"), class: "toggle #{type}")
  end
end
