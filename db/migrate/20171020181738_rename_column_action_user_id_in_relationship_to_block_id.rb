class RenameColumnActionUserIdInRelationshipToBlockId < ActiveRecord::Migration[5.1]
  def change
    rename_column :relationships, :action_user_id, :block_id
  end
end
