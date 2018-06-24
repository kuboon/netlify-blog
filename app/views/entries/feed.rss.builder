xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Trick with net"
    xml.author "Ohkubo Kohei (kuboon)"
    xml.description "Software-Development, Science, Magic"
    xml.link 'http://kuboon.trick-with.net'
    xml.language "ja"

    for entry in @entries
      xml.item do
        xml.title entry.title
        xml.author "kuboon"
        xml.pubDate entry.created_at.to_s(:rfc822)
        xml.link entry_url(entry)
        xml.guid entry.uuid

        xml.description render_content entry
		# if you like, do something with your content text here e.g. insert image tags.
		# Optional. I'm doing this on my website.
     #    if entry.image.exists?
     #        image_url = entry.image.url(:large)
     #        image_caption = entry.image_caption
     #        image_align = ""
     #        image_tag = "
     #            <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
     #          "
     #        text = text.sub('{image}', image_tag)
     #    end
      end
    end
  end
end
