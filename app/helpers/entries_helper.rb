module EntriesHelper
  def render_content(entry)
    entry.to_html.gsub(%r|"quiver-note-url/([^"]+)"|) do |path|
    end
  end
end
