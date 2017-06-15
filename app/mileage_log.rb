class MileageLog
  attr_accessor :date, :start, :finish

  def initialize(attrs={})
    attrs.each { |k, v| self.send("#{k}=", v) }
  end
end