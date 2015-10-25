class Tbo < ActiveRecord::Base
  before_update :update_remaining_time
  private
  def update_remaining_time
    self.remaining_time = self.tbo - self.elapsed_time
  end
end
