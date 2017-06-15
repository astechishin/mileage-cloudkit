class MileageStore
  def self.shared
    Dispatch.once { @instance ||= new() }
    @instance
  end

  def numberOfObjects
    @log_entries.count
  end

  def objectAtIndexPath(index)
    @log_entries[index]
  end

  def add_entry(mileage_log)
    @log_entries << mileage_log
  end

  def self.convert_date(date_string)
    date_formatter.dateFromString(date_string)
  end

  def self.date_formatter
    @date_formatter ||= NSDateFormatter.alloc.init.tap do |fmt|
      fmt.setLocale(NSLocale.alloc.initWithLocaleIdentifier('en_US_POSIX'))
      fmt.setDateFormat("yyyy'-'MM'-'dd")
    end
  end

  private
  def initialize()
    @log_entries = []
  end
end