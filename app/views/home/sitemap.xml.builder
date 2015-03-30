xml.instruct!
xml.urlset 'xmlns' => 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  xml.url do
    xml.loc root_url
    xml.changefreq 'monthly'
    xml.priority 1
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc about_us_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc our_doctors_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc our_services_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc clinical_research_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc request_appointment_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end

  xml.url do
    xml.loc contact_us_url
    xml.changefreq 'monthly'
    xml.priority 0.9
    xml.lastmod Date.today.to_s
  end
end
