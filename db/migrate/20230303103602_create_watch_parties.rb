class CreateWatchParties < ActiveRecord::Migration[7.0]
  def change
    create_table :watch_parties do |t|
       t.string :session_id, null:false
       t.boolean :expired, default: false

       t.timestamps
     end
   end
end
