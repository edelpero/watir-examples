require 'watir-webdriver'

# Available drivers: :firefox, :chrome, :phantomjs
browser = Watir::Browser.new(:firefox)

# Visit url
browser.goto('bit.ly/watir-webdriver-demo')

# Checks for a select_list existence
browser.select_list.exists?

# Gets the select list with id
browser.select_list(id: 'entry_1')

# Selects option with value 'Ruby'
browser.select_list(id: 'entry_1').select('Ruby')

# Iterates over select options
browser.select_list(id: 'entry_1').options.each do |option|
  puts option.value
  puts option.text
end

# Returns the value of the selected option
browser.text_field(id: 'entry_0').value

# Close browser
browser.close
