class CreateSocialNetworksSocialNetworks < ActiveRecord::Migration

  def up
    create_table :refinery_social_networks do |t|
      t.string :name
      t.string :profile_url
      t.integer :icon_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-social_networks"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/social_networks/social_networks"})
    end

    drop_table :refinery_social_networks

  end

end
