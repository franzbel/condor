class Flight < ActiveRecord::Base

  before_save :sum_total

  private
  def sum_total
    self.total = Flight.sum(:hours) + Flight.sum(:minutes)/60 + Flight.sum(:seconds)/3600 + self.hours + self.minutes/60 + self.seconds/3600
  end
end

