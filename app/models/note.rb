class Note
  def initialize(body, meta)
    @body, @meta = body, meta
  end
  def created_at
    @meta['created_at']
  end
  def title
    @meta['title']
  end
  def slug
    @meta['slug']
  end
  def uuid
    "https://kuboon.trick-with.net/" + slug
  end
  def to_html
    body = @body.gsub(/# ?#{title}/, '')
    redcarpet.render(body)
  end
  def redcarpet
    @redcarpet ||= Redcarpet::Markdown.new(::MyRenderer.new(hard_wrap: true), strikethrough: true, fenced_code_blocks: true, tables: true, autolink: true)
  end
end
