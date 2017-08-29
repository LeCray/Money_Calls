class CreateDownlines < ActiveRecord::Migration[5.0]
  def change
    create_table :downlines do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :referral

      t.timestamps
    end
  end
end
