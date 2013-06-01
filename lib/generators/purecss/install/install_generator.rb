require 'rails/generators'

module Purecss
  module Generators
    class InstallGenerator < ::Rails::Generators::Base

      source_root File.expand_path("../templates", __FILE__)
      desc "This generator installs Purecss to Asset Pipeline"
      argument :stylesheets_type, :type => :string, :default => 'static'

      def add_assets

        js_manifest = 'app/assets/javascripts/application.js'

        if File.exist?(js_manifest)
          insert_into_file js_manifest, "//= require purecss\n", :after => "jquery_ujs\n"
        else
          copy_file "application.js", js_manifest
        end

        css_manifest = 'app/assets/stylesheets/application.css'

        if File.exist?(css_manifest)
          # Add our own require:
          content = File.read(css_manifest)
          if content.match(/require_tree\s+\.\s*$/)
            # Good enough - that'll include our purecss_and_overrides.css
          else
            style_require_block = " *= require purecss_and_overrides\n"
            insert_into_file css_manifest, style_require_block, :after => "require_self\n"
          end
        else
          copy_file "application.css", "app/assets/stylesheets/application.css"
        end

      end

      def add_purecss
        copy_file "purecss_and_overrides.css", "app/assets/stylesheets/purecss_and_overrides.css"
        
        if use_coffeescript?
          copy_file "purecss.coffee", "app/assets/javascripts/purecss.js.coffee"
        else
          copy_file "purecss.js", "app/assets/javascripts/purecss.js"
        end
      end

      def add_locale
        if File.exist?("config/locales/en.purecss.yml")
          localez = File.read("config/locales/en.purecss.yml")
          insert_into_file "config/locales/en.purecss.yml", localez, :after => "en\n"
        else
          copy_file "en.purecss.yml", "config/locales/en.purecss.yml"
        end
      end

      def cleanup_legacy
        # Remove old requires (if any) that included purecss directly:
        gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*purecss\s*\n|, "")
        gsub_file("app/assets/stylesheets/application.css", %r|\s*\*=\s*purecss_and_overrides\s*\n|, "")
      end

    private
      def use_coffeescript?
        ::Rails.configuration.app_generators.rails[:javascript_engine] == :coffee
      end
    end
  end
end