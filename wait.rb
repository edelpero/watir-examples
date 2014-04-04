require 'watir-webdriver'

# Available drivers: :firefox, :chrome, :phantomjs
browser = Watir::Browser.new(:firefox)

# Visit url
browser.goto('http://shop.uclastore.com/courselistbuilder.aspx')

browser.select_list(id: 'clCampusSelectBox').select('UCLA')
browser.select_list(id: 'clTermSelectBox').select('SPRING 2014')
browser.select_list(id: 'clDeptSelectBox').select('AFRKLA - AFRICAN LANGUAGES')

# Here it will fail because the option isn't loaded yet
# browser.select_list(id: 'clCourseSelectBox').select('1C')

Watir::Wait.until do
  browser.select_list(id: 'clCourseSelectBox').options.first.value != '0'
end

browser.select_list(id: 'clCourseSelectBox').select('1C')

Watir::Wait.until do
  browser.select_list(id: 'clSectionSelectBox').options.first.value != '0'
end

browser.select_list(id: 'clSectionSelectBox').select('1 - IVANOVA, O.')

# Close browser
# browser.close

