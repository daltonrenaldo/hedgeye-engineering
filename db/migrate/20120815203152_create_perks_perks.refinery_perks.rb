# This migration comes from refinery_perks (originally 1)
class CreatePerksPerks < ActiveRecord::Migration

  def up
    create_table :refinery_perks do |t|
      t.string :title
      t.text :description
      t.string :teaser
      t.integer :teaser_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-perks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/perks/perks"})
    end

    drop_table :refinery_perks

  end

end
