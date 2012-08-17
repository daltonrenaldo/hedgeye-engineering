class CreateSlidesSlides < ActiveRecord::Migration

  def up
    create_table :refinery_slides do |t|
      t.string :title
      t.integer :image_id
      t.string :caption
      t.string :post_slug
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-slides"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/slides/slides"})
    end

    drop_table :refinery_slides

  end

end
