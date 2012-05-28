class CreateDistributions < ActiveRecord::Migration
  def change
    create_table :distributions do |t|
      t.string :site
      t.string :age
      t.decimal :population
      t.decimal :customer

      t.timestamps
    end
  end
end
