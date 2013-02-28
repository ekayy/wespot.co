class AddSubdomainToPlace < ActiveRecord::Migration
  def change
    add_column :places, :subdomain, :string
  end
end
