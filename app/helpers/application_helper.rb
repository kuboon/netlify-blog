module ApplicationHelper
  def ogp_tags(hash)
    url = URI.parse(request.url)
    url.host = Rails.application.config.host
    hash.reverse_merge!(
      url: url.to_s,
      site_name: 'kuboon.trick-with.net',
      description: 'Ohkubo KOHEI'
    )
    safe_join(hash.map do |k, v|
      tag :meta, property: "og:#{k}", content: v
    end)
  end
  def link_to_url(url)
    link_to url, url
  end
end
