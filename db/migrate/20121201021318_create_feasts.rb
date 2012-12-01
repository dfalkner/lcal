class CreateFeasts < ActiveRecord::Migration
  def change
    create_table :feasts do |t|
      t.integer :ordo_id
      t.integer :month
      t.integer :day
      t.integer :rank_id
      t.integer :color_id
      t.string :title

      t.timestamps
    end

  end
end
