class CreatePotatoPriceTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :potato_price_times do |t|
      t.datetime :time
      t.decimal :value

      t.timestamps
    end
  end
end
