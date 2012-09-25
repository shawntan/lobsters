class AddIsLearningSummaryToComment < ActiveRecord::Migration
  def change
    add_column :comments, :is_learning_summary, :boolean, :default => false
  end
end
