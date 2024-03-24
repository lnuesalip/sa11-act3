def extract_urls(text)
  pattern = /(http|https|ftp)(:\/\/)(www.)?([a-zA-Z]*)(.com|.org|.net|.int|.edu|.gov|.mil)(\/[^.]*)?/
  urls = text.scan(pattern)

  # urls is a nested array with each grouping being an element within a url (which is an element within urls)
  # flatten so each url is its own element
  new_urls = []
  urls.each do |elem|
    joined_url = elem.join()
    new_urls.append(joined_url)
  end

  # return array with joined urls
  new_urls
end

sample_text = "Visit our site at http://www.example.org for more
information. Check out our search page at
https://example.com/search?q=ruby+regex. Don’t forget to ftp our
resources at ftp://example.com/resources."

# print each url on a new line
extract_urls(sample_text).each do |elem|
  puts "#{elem}"
end
