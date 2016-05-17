class AddUpladableIdToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploadable_id, :integer
  end
end
