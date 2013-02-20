require 'sitemap_generator'

module GoogleSitemapGenerator
  class << self
    def registered(app)
      app.after_build do |builder|
        app_sitemap = sitemap # avoid name conflict
        SitemapGenerator::Sitemap.default_host = "http://mattolson.com"
        SitemapGenerator::Sitemap.create(:public_path => 'build', :verbose => true) do
          app_sitemap.resources.each do |r|
            add(r.url) if r.ext == '.html'
          end
        end
      end
    end
    alias :included :registered
  end
end

::Middleman::Extensions.register(:sitemap_generator, GoogleSitemapGenerator) 

