module Refinery
  module Teammates
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Teammates

      engine_name :refinery_teammates

      initializer "register refinerycms_teammates plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "teammates"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.teammates_admin_teammates_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/teammates/teammate'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Teammates)
      end
    end
  end
end
