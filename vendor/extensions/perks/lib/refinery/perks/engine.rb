module Refinery
  module Perks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Perks

      engine_name :refinery_perks

      initializer "register refinerycms_perks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "perks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.perks_admin_perks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/perks/perk'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Perks)
      end
    end
  end
end
