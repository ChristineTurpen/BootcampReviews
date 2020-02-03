class CreateBootcamps < ActiveRecord::Migration[5.2]
  def change
    create_table :bootcamps do |t|
      t.string :name
      t.text :description
      t.string :university
      t.timestamps
    end
  end
end
