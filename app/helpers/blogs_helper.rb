module BlogsHelper
  class CodeRayify < Redcarpet::Render::HTML
    def block_code(code, language)
        CodeRay.scan(code,language).div
    end
  end

  def markdown(text)
    coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

    options = {
        fenced_code_blocks: true,
        no_intra_emphasis: true,
        autolink: true,
        lax_html_blocks: true,
    }

    markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
    markdown_to_html.render(text).html_safe
  end
  def tag_links(tags)
        tags.split(",").map { |t| link_to t, tag_path(t) }.join(', ')
  end

  def tag_cloud(tags, classes)
        max = tags.sort_by(&:count).last
        tags.each do |tag|
          index = tag.count.to_f / max.count * (classes.size-1)
          yield(tag, classes[index.round])
      end
  end

      
end
