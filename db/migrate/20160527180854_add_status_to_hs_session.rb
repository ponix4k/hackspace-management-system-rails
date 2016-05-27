class AddStatusToHsSession < ActiveRecord::Migration
  def change
    add_column :hs_sessions, :status, :string
  end
end
