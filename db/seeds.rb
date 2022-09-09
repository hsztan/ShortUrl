# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Url.create(short_url: Url.create_short_url, original_url: 'http://google.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://facebook.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://yahoo.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://youtube.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://amazon.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://wikipedia.org', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://twitter.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://instagram.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://linkedin.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://pinterest.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://reddit.com', created_at: Time.now)
Url.create(short_url: Url.create_short_url, original_url: 'http://netflix.com', created_at: Time.now)
