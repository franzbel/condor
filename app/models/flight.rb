class Flight < ActiveRecord::Base

  before_save :write_total
  after_save :update_tbo
  before_update :update_total
  after_update :update_totals
  after_destroy :update_totals


  private
  def write_total
    self.total = Flight.sum(:hours)        +
                 Flight.sum(:minutes)/60   +
                 Flight.sum(:seconds)/3600 +
                 self.hours                +
                 self.minutes/60           +
                 self.seconds/3600
  end

  def update_total
    self.total = Flight.where("id < #{self.id}").sum(:hours)        +
                 Flight.where("id < #{self.id}").sum(:minutes)/60   +
                 Flight.where("id < #{self.id}").sum(:seconds)/3600 +
                 self.hours                                         +
                 self.minutes/60                                    +
                 self.seconds/3600
  end

  def update_totals
    flights = Flight.where("id > #{self.id}")
    flights.each do |flight|
      flight.total = Flight.where("id <= #{flight.id}").sum(:total)
      flight.save
    end
  end

  def update_tbo
    tbos = Tbo.all
    tbos.each do |tbo|
      tbo.remaining_time = tbo.tbo - Flight.last.total
      tbo.elapsed_time = Flight.last.total
      tbo.save
    end
  end
end

