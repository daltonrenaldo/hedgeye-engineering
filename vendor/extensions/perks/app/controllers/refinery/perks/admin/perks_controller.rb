module Refinery
  module Perks
    module Admin
      class PerksController < ::Refinery::AdminController

        crudify :'refinery/perks/perk', :xhr_paging => true

      end
    end
  end
end
