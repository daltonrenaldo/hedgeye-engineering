module Refinery
  module SocialNetworks
    module Admin
      class SocialNetworksController < ::Refinery::AdminController

        crudify :'refinery/social_networks/social_network',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
