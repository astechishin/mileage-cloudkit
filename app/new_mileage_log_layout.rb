class NewMileageLogLayout < MotionKit::Layout

  def layout
    backgroundColor UIColor.whiteColor

    add UILabel, :date
    add UILabel, :start_label
    add UITextField, :start
    add UILabel, :finish_label
    add UITextField, :finish
    add UIButton, :button
  end

  def date_style
    # font header_content_font
    top 40
    constraints do
      center_x.equals(:superview)
    end
  end

  def start_label_style
    font UIFont.fontWithName('Helvetica Neue', size: 12)
    text_color UIColor.grayColor
    text 'Mileage start'
    sizeToFit

    constraints do
      top.equals(:date, :bottom).plus(15)
      center_x.equals(:superview)
    end
  end

  def start_style
    text_alignment NSTextAlignmentCenter
    border_style UITextBorderStyleLine

    keyboardType UIKeyboardTypeDecimalPad
    constraints do
      top.equals(:start_label, :bottom).plus(5)
      center_x.equals(:superview)
      width.is.at_least(100)
    end
  end

  def finish_label_style
    font UIFont.fontWithName('Helvetica Neue', size: 12)
    text_color UIColor.grayColor
    text 'Mileage finish'
    sizeToFit

    constraints do
      top.equals(:start, :bottom).plus(15)
      center_x.equals(:superview)
    end
  end

  def finish_style
    text_alignment NSTextAlignmentCenter
    border_style UITextBorderStyleBezel

    keyboardType UIKeyboardTypeDecimalPad
    constraints do
      top.equals(:finish_label, :bottom).plus(5)
      center_x.equals(:superview)
      width.is.at_least(100)
    end
  end

  def button_style
    setTitle('Save Mileage Entry', forState: UIControlStateNormal)
    setTitleColor(UIColor.blackColor, forState: UIControlStateNormal)
    sizeToFit

    constraints do
      top.equals(:finish, :bottom).plus(20)
      center_x.equals(:superview)
      width.is.at_least(100)
    end
  end
end