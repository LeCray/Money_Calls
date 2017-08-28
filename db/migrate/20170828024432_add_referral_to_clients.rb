class AddReferralToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :referral, :string
  end
end
