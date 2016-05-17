class AddUpladableTypeToUploads < ActiveRecord::Migration
  def change
    add_column :uploads, :uploadable_type, :string
  end
end
