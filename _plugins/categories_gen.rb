puts 'Generating categories...'
require 'rubygems'
require 'jekyll'
include Jekyll::Filters

options = Jekyll.configuration({})
site = Jekyll::Site.new(options)
site.read_posts('')

html =<<-HTML
---
layout: default
title: Tags
---

<h1>Sorted by categories</h1>

    HTML

site.categories.sort.each do |category, posts|
  html << <<-HTML
      <h2 id="#{category}">#{category}</h3>
      HTML

  html << '<ul class="posts">'
  posts.each do |post|
    post_data = post.to_liquid
    html << <<-HTML
          <li>
            <span>#{date_to_string post.date}</span>
            <a href="#{post.url}">#{post_data['title']}</a>
          </li>
        HTML
  end
  html << '</ul>'
end

File.open('categories.html', 'w') do |file|
  file.puts html
end
puts 'Done generating categories.'
