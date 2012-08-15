module Refinery
  module SocialNetworks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::SocialNetworks

      engine_name :refinery_social_networks

      initializer "register refinerycms_social_networks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "social_networks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.social_networks_admin_social_networks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/social_networks/social_network',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::SocialNetworks)
      end
    end
  end
end
