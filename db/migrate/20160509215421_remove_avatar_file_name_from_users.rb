class RemoveAvatarFileNameFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :avatar_file_name, :string
    remove_column :users, :avatar_file_size, :integer
    remove_column :users, :avatar_updated_at, :datetime
    remove_column :users, :avatar_content_type, :string
  end
end
