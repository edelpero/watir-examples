require 'watir-webdriver'

# Available drivers: :firefox, :chrome, :phantomjs
browser = Watir::Browser.new(:phantomjs)

# Visit url
browser.goto('http://shop.uclastore.com/courselistbuilder.aspx')

# Save a screenshot to localhost
browser.screenshot.save 'picture.png'

# Get image base64 encoding
# puts browser.screenshot.base64

# Close browser
browser.close