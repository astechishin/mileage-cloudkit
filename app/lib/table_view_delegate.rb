module TableViewDelegate
  def tableView(tableView, numberOfRowsInSection:section)
    @fetch_controller.numberOfObjects
  end

  def tableView(tableView, cellForRowAtIndexPath:indexPath)
    cell = tableView.dequeueReusableCellWithIdentifier(cell_id) ||
        UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle,
                                            reuseIdentifier: cell_id)
    configureCell(cell, atIndexPath:indexPath)
  end
end