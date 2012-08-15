module Refinery
  module Teammates
    module Admin
      class TeammatesController < ::Refinery::AdminController

        crudify :'refinery/teammates/teammate', :xhr_paging => true

      end
    end
  end
end
