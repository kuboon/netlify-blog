class Notebook
  ROOT = Rails.root.join('markdown')
  def self.slug_hash
    @notes ||= begin
      ret = {}
      Dir[ROOT + '*/*'].each do |file|
        next if File.directory? file
        entry = File.read file
        parts = entry.split('---')
        meta = YAML.load(parts[1])
        slug = meta['slug']
        ret[slug] = Note.new(parts[2], meta)
      end
      ret
    end
  end
end
