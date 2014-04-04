require 'watir-webdriver'

# Available drivers: :firefox, :chrome, :phantomjs
browser = Watir::Browser.new(:firefox)

# Visit url
browser.goto('bit.ly/watir-webdriver-demo')

# Check for text_field presence
browser.text_field(id: 'entry_0').exists?

# Sets value on the first text_field found
browser.text_field.set('Watir')

# Sets value on text_field with id
browser.text_field(id: 'entry_0').set('Updated by ID')

# Sets value on text_field with name
browser.text_field(name: 'entry.0.single').set('Updated by Name')

# Gets value on text_field
browser.text_field(id: 'entry_0').value

# Close browser
browser.close