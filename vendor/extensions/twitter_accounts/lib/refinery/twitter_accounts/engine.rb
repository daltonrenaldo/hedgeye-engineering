module Refinery
  module TwitterAccounts
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::TwitterAccounts

      engine_name :refinery_twitter_accounts

      initializer "register refinerycms_twitter_accounts plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "twitter_accounts"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.twitter_accounts_admin_twitter_accounts_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/twitter_accounts/twitter_account',
            :title => 'username'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::TwitterAccounts)
      end
    end
  end
end
