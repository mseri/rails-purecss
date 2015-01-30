require 'rails/generators'

module Purecss
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')
      argument :stylesheets_type, :type => :string, :default => 'responsive', :banner => '*responsive or nonresponsive'
      class_option :add_viewport_meta, :type => :boolean, :default => false, :description => "Inject Viewport Meta in the Head of layout/application.html.erb (default: false)"
      
      def add_assets
        if stylesheets_type=='nonresponsive'
          purecss_type = 'purecss-nr'
        elsif stylesheets_type=='responsive'
          purecss_type = 'purecss'
        else
          raise "'#{stylesheets_type}'' is not recognized, use either 'responsive' or 'nonresponsive'"
          
        end

        insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "#{detect_css_format[1]} require #{purecss_type}\n", :after => "require_self\n"
        
        if options.add_viewport_meta
          if not File.exist?("app/views/layouts/application.html.erb")
            raise "Unable to add viewport meta tag to  (see https://github.com/mseri/rails-purecss/issues/6)"
          end
          insert_into_file "app/views/layouts/application.html.erb", "  <!-- Set the viewport width to device width for mobile -->\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n", :before => "</head>"   
        end
      end
      
      def detect_css_format
        return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
        return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
        return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
        return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
        return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
      end
    end
  end
end
