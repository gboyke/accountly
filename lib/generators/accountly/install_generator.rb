require 'rails/generators'
require 'rails/generators/migration'

module Accountly
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration

    attr_accessor :user_name, :session_name

    argument :user_name, :type => :string, :default => "user"

    source_root File.expand_path("../../templates", __FILE__)

    def create_views
      directory "views", "app/views/accountly"
    end

    # übergeordneter Account-Controller
    def create_controllers
      directory "controllers", "app/controllers"
    end

    def create_locales
      template "config/locales/de.yml", "config/locales/de.accountly.yml"
      template "config/locales/en.yml", "config/locales/en.accountly.yml"
    end

    def create_config_files

    end

    def setup_routes
      route "mount Accountly::Engine => '/account', :as => 'accountly_engine'"
    end

    def create_migration
      migration_template 'db/migrate/add_new_email_to_users.rb', "db/migrate/add_new_email_to_users.rb"
    end

    private

    def user_singular_name
      user_name.underscore
    end

    def user_plural_name
      user_singular_name.pluralize
    end

    def user_class_name
      user_name.camelize
    end

    def user_plural_class_name
      user_plural_name.camelize
    end

    def session_singular_name
      session_name.underscore
    end

    def session_plural_name
      session_singular_name.pluralize
    end

    def session_class_name
      session_name.camelize
    end

    def session_plural_class_name
      session_plural_name.camelize
    end

    def self.next_migration_number(dirname) #:nodoc:
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

  end
end
