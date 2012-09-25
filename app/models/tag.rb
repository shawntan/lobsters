class Tag < ActiveRecord::Base
  attr_accessor :filtered_count

  scope :accessible_to, ->(user) do
    user.is_admin?? all : where(:privileged => false)
  end

  # currently unused, for showing number of users using a filter
  # Usage: 
  #   <%= f.select "tags_a", Tag.order(:tag).map{|t|
  #   [ "#{t.tag} - #{t.description}", t.tag ] }, {},
  #   { :multiple => true } %>
  def self.all_with_filtered_counts_for(user)
    counts = TagFilter.count(:group => "tag_id")

    Tag.order(:tag).accessible_to(user).map{|t|
      t.filtered_count = counts[t.id].to_i
      t
    }
  end

  def valid_for?(user)
    if self.privileged?
      user.is_admin?
    else
      true
    end
  end

  def filtered_count
    @filtered_count ||= TagFilter.where(:tag_id => self.id).count
  end
end
