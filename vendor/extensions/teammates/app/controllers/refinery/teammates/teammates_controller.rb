module Refinery
  module Teammates
    class TeammatesController < ::ApplicationController

      before_filter :find_all_teammates
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @teammate in the line below:
        present(@page)
      end

      def show
        @teammate = Teammate.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @teammate in the line below:
        present(@page)
      end

    protected

      def find_all_teammates
        @teammates = Teammate.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/teammates").first
      end

    end
  end
end
