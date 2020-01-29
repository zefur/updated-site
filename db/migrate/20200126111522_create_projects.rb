class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :github
      t.text :image
      t.text :thumb

      t.timestamps
    end
  end
end
