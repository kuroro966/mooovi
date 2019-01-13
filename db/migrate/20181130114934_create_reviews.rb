class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

      
      t.integer      :product_id
      t.string        :nickname
      t.integer        :evaluation
      t.text        :review
      t.timestamps
    end
  end
end