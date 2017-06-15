class NewMileageLogController < UIViewController
  attr_accessor :parent

  def loadView
    @layout = NewMileageLogLayout.new
    self.view = @layout.view

    self.edgesForExtendedLayout = UIRectEdgeNone
    assign_view_elements
  end

  def viewDidLoad
    super
    self.title = 'New Log Entry'
    set_view_elements

    self.navigationItem.rightBarButtonItem =
        UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemDone,
                                                          target:self, action:'done:')
  end

  def done(sender)
    MileageStore.shared.add_entry(MileageLog.new(date: @the_date, start: @start.text.to_f, finish: @finish.text.to_f))
    parent.tableView.reloadData
    self.navigationController.popViewControllerAnimated(true)
  end

  def assign_view_elements
    @date_label = @layout.get(:date)
    @start = @layout.get(:start)
    @finish = @layout.get(:finish)
    @button = @layout.get(:button)
    @button.addTarget(self, action: 'done:', forControlEvents: UIControlEventTouchUpInside)
  end

  def set_view_elements
    @the_date = NSDate.date
    @date_label.text = MileageStore.date_formatter.stringFromDate(@the_date)
    @date_label.sizeToFit
  end
end