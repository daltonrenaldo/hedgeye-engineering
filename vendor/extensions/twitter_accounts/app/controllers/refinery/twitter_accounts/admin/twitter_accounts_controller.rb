module Refinery
  module TwitterAccounts
    module Admin
      class TwitterAccountsController < ::Refinery::AdminController

        crudify :'refinery/twitter_accounts/twitter_account',
                :title_attribute => 'username', :xhr_paging => true

      end
    end
  end
end
