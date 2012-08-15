module Refinery
  module Perks
    class Perk < Refinery::Core::BaseModel
      self.table_name = 'refinery_perks'

      attr_accessible :title, :description, :teaser, :teaser_image_id, :position

      acts_as_indexed :fields => [:title, :description, :teaser]

      validates_presence_of :description

      validates :title, :presence => true, :uniqueness => true

      belongs_to :teaser_image, :class_name => '::Refinery::Image'
    end
  end
end
