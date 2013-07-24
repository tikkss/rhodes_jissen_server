class CreateJsonSamples < ActiveRecord::Migration
  def change
    create_table :json_samples do |t|
      t.string :title
      t.text :content

      t.timestamps
    end
  end
end
