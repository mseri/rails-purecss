require 'rails/generators'

module Purecss
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.join(File.dirname(__FILE__), 'templates')
      argument :stylesheets_type, :type => :string, :default => 'responsive', :banner => '*responsive or nonresponsive'
      
      def add_assets
        if stylesheets_type=='nonresponsive'
          purecss_type = 'pure-nr-min'
        elsif stylesheets_type=='responsive'
          purecss_type = 'pure-min'
        else
          raise "'#{stylesheets_type}'' is not recognized, use either 'responsive' or 'nonresponsive'"
          
        end

        insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "#{detect_css_format[1]} require #{purecss_type}\n", :after => "require_self\n"              
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
