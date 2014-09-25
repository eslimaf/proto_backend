class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :content
      t.string :gcm_id

      t.timestamps
    end
  end
end
