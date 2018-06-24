class EntriesController < ApplicationController
  before_action do
    expires_in(1.minutes, public: true)
  end

  # GET /entries
  def index
  end
  def feed
  end

  def show(id)
    @entry = slug_hash[id] or raise ActiveRecord::RecordNotFound
    @disqus_url = "http://kuboon.trick-with.net/entries/#{id}"
  end

  private

  def entries
    @entries ||= slug_hash.values.sort_by(&:created_at).reverse
  end
  helper_method :entries

  def slug_hash
    @slug_hash ||= Notebook.slug_hash
  end
  def uuid_hash
    @uuid_hash ||= begin
      ret = {}
      slug_hash.values.each do |note|
        ret[note.uuid] = note
      end
      ret
    end
  end
  helper_method :uuid_hash
end

class ::MyRenderer < Redcarpet::Render::HTML
  def image(url, _, alt)
    #cloudinary = 'https://res.cloudinary.com/kuboon/image/fetch/w_600/'
    "<img src='#{url}' alt='#{alt}' />"
  end
  def table(header, body)
    "<table class='table table-striped table-bordered'><thead>\n#{header}</thead><tbody>\n#{body}</tbody></table>\n"
  end
  def autolink(link, link_type)
    case link_type
      when :url then url_link(link)
      when :email then email_link(link)
    end
  end
  def url_link(link)
    case link
      when %r[^https://www.youtube.com] then youtube_link(link)
      else normal_link(link)
    end
  end
  def youtube_link(link)
    parameters_start = link.index('?')
    video_id = link[parameters_start + 3..-1]
    "<iframe width=\"560\" height=\"315\" src=\"//www.youtube.com/embed/#{video_id}?rel=0\" frameborder=\"0\" allowfullscreen></iframe>"
  end
  def normal_link(link)
    "<a href=\"#{link}\">#{link}</a>"
  end
  def email_link(email)
    "<a href=\"mailto:#{email}\">#{email}</a>"
  end
end
