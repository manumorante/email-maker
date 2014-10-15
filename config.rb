###
# Vars
###

require 'source/vars'

###
# Defauls dirs
###

# set :css_dir, 'stylesheets'
# set :js_dir, 'javascripts'
# set :images_dir, 'images'
# set :fonts_dir, 'fonts'
# set :relative_links, true



require 'source/helpers/application_helper'
helpers ApplicationHelper



###
# Compass
###

compass_config do |config|

  # DEBUG MODE
  config.sass_options = { :debug => true, :debug_info => true, :line_comments => false }

  # BUILD MODE
  # config.output_style = :compressed
  # config.sass_options = { :debug => false, :debug_info => false, :line_comments => false }

end

# Build-specific configuration
configure :build do
  #activate :minify_css
  #activate :minify_javascript
  #activate :relative_assets
  #activate :directory_indexes

  Vars::APP_URL = Vars::APP_ONLINE

  # Ignore
  ignore 'helpers/*'
  ignore 'moda_window/*'


  # Enable cache buster
  #activate :asset_hash

  # Or use a different image path
  # set :http_path, "/Content/images/"

end


###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# require 'source/helpers/application_helper'
# helpers ApplicationHelper

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end