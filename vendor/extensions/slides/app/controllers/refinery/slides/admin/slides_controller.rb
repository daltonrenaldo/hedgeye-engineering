module Refinery
  module Slides
    module Admin
      class SlidesController < ::Refinery::AdminController

        crudify :'refinery/slides/slide', :xhr_paging => true

      end
    end
  end
end
