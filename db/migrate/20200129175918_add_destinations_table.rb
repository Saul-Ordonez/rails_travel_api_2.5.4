class AddDestinationsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :city
      t.string :country
    end
  end
end
