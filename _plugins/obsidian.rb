# Makes an Obsidian vault work as a Jekyll / Just the Docs site:
#  * every note gets its file name as title (so it shows in the sidebar)
#  * [[Note]], [[Note|alias]], [[Note#Heading]] become links
#  * ![[image.png]] becomes an image
# Links inside ``` code blocks are left alone. Links to notes that don't
# exist yet are shown as plain text.
require "erb"
require "uri"

module Obsidian
  def self.encode_url(url)
    url.split("/", -1).map { |s| ERB::Util.url_encode(URI.decode_www_form_component(s)) }.join("/")
  end

  def self.slug(heading)
    heading.downcase.strip.gsub(/[^\p{Word}\- ]/u, "").tr(" ", "-")
  end
end

Jekyll::Hooks.register :site, :post_read do |site|
  site.pages.each do |page|
    next unless page.ext == ".md"
    page.data["title"] ||= File.basename(page.name, ".md")
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  base = site.baseurl.to_s
  notes = {}
  site.pages.each { |p| notes[File.basename(p.name, ".md").downcase] = p if p.ext == ".md" }
  files = {}
  site.static_files.each { |f| files[f.name.downcase] = f }

  site.pages.each do |page|
    next unless page.ext == ".md"
    parts = page.content.split(/(^```.*?^```)/m)
    page.content = parts.each_with_index.map do |chunk, i|
      next chunk if i.odd? # code block

      chunk
        .gsub(/!\[\[([^\]|]+)(?:\|([^\]]*))?\]\]/) do
          name, alt = $1.strip, $2
          file = files[File.basename(name).downcase]
          if file
            url = base + Obsidian.encode_url(file.relative_path.sub(%r{^/?}, "/"))
            "![#{alt || name}](#{url})"
          elsif (note = notes[name.downcase])
            "[#{note.data['title']}](#{base}#{Obsidian.encode_url(note.url)})"
          else
            name
          end
        end
        .gsub(/\[\[([^\]|#]*)(?:#([^\]|]*))?(?:\|([^\]]*))?\]\]/) do
          name, heading, label = $1.strip, $2, $3
          note = name.empty? ? page : notes[name.downcase]
          text = label || (name.empty? ? heading : name)
          if note
            anchor = heading ? "##{Obsidian.slug(heading)}" : ""
            "[#{text}](#{base}#{Obsidian.encode_url(note.url)}#{anchor})"
          else
            "<span class=\"text-grey-dk-000\" title=\"Ta strona jeszcze nie istnieje\">#{text}</span>"
          end
        end
    end.join
  end
end
