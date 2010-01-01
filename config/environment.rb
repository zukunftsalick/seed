# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.1.2' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')
require File.join(File.dirname(__FILE__), '../vendor/plugins/engines/boot')

Rails::Initializer.run do |config|
  
  config.plugin_paths += ["#{RAILS_ROOT}/vendor/plugins/seed"]

  config.gem 'mislav-will_paginate', :version => '~> 2.3.2', :lib => 'will_paginate', 
      :source => 'http://gems.github.com'

  config.time_zone = 'UTC'

  config.action_controller.session = {
    :session_key => '_seed_session',
    :secret      => '24710eaf4fe9360fb647163a9ebe4d2688fb83c2e3ebdeb46a30822066cf47331e3b854431f7514c06e3c48b30ff4e8074e0a1d8422a1210a7eb18bd01af557e'
  }

  config.action_controller.session_store = :active_record_store

  config.active_record.observers = :user_observer
  
  config.load_paths << "#{RAILS_ROOT}/app/sweepers"
end

ActionController::Base.prepend_view_path("vendor/plugins/#{APP_CONFIG[:app_name]}_engine/app/views")

require 'seed_stylesheets'
