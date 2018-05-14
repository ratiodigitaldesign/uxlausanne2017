require "uri"

urls = Array.new

Dir.glob(File.join("**", "*")).each { |file|
	next if File.directory? file
	content = File.open file, 'r'
	urls += URI.extract(content.read).keep_if { |url|  url.include? 'cloudinary' }
}

urls.uniq!

puts urls