###
# Vars
###

require 'source/vars'

###
# Defauls dirs
###

# set :images_dir, 'images'
set :relative_links, true


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
  ignore 'helpers/*'
  ignore 'vars.rb'
end



###
# Helpers
###

require 'source/helpers/application_helper'
helpers ApplicationHelper

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes