module ActionViewTemplatePrepender
  def render(*args, &block)
    with_inspector { super }.html_safe
  end

  private

  def with_inspector(*args)
    fail 'Please give me block!' unless block_given?

    buffer = yield

    doc = Nokogiri::HTML::DocumentFragment.parse(buffer)
    doc = Nokogiri::HTML.fragment('<div></div>').tap { |fragment| fragment.children.first.add_child(doc) } if doc.children.size > 1
    root = doc.children.first
    css_class = root.get_attribute(:class).to_s
    root.set_attribute(:class, (css_class.split(' ') + [inspector_class]).join(' '))
    root.children.first.add_previous_sibling("<div class='viewtlip_virtual_path'>#{@virtual_path}</div>")

    if buffer.html_safe?
      buffer.class.new(doc.to_html)
    else
      doc.to_html
    end
  end

  def inspector_class
    'viewtlip_inspector'
  end
end

ActionView::Template.send(:prepend, ActionViewTemplatePrepender)
