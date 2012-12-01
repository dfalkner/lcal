class CreateCommonsFeastsJoinTable < ActiveRecord::Migration
  def up
      create_table :commons_feasts, :id => false do |t|
        t.integer :common_id
        t.integer :feast_id
      end
    end



  def down
    drop_table :commons_feasts
  end
end
