class AddAutoSignedOutToHsSession < ActiveRecord::Migration
  def change
    add_column :hs_sessions, :auto_signed_out, :boolean, default: false
  end
end
