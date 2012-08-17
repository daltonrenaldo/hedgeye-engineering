module Refinery
  module Slides
    class Slide < Refinery::Core::BaseModel
      self.table_name = 'refinery_slides'

      attr_accessible :title, :image_id, :caption, :post_slug, :position

      acts_as_indexed :fields => [:title, :caption, :post_slug]

      validates_presence_of :image_id

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'
    end
  end
end
