class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :rating
      t.text :description
      t.string :director
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.date :released_on

      t.timestamps
    end
  end
end
