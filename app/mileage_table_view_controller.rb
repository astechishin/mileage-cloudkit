class MileageTableViewController < UITableViewController
  include TableViewDelegate

  def viewDidLoad
    super
    self.title = 'Mileage'
    @fetch_controller = MileageStore.shared



    self.navigationItem.rightBarButtonItem =
        UIBarButtonItem.alloc.initWithBarButtonSystemItem(UIBarButtonSystemItemAdd,
                                                          target:self, action:'new_log_entry:')
  end

  def new_log_entry(sender)
    new_entry_controller = NewMileageLogController.new
    new_entry_controller.parent = self
    self.navigationController.pushViewController(new_entry_controller, animated: true)
  end

  def tableView(tableView, didSelectRowAtIndexPath: index_path)
    mile_log = @fetch_controller.objectAtIndexPath(index_path.row)
  end

  def configureCell(cell, atIndexPath:index)
    mile_log = @fetch_controller.objectAtIndexPath(index.row)
    cell.textLabel.text = MileageStore.date_formatter.stringFromDate(mile_log.date)
    cell.detailTextLabel.text = "#{mile_log.start} to #{mile_log.finish.nil? ? '??' : mile_log.finish}"
    cell
  end

  def cell_id
    'MileLog-Cell'
  end
end