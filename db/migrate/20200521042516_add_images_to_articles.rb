class AddImagesToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :images, :string, array: true, default: []
  end
end
