#!/usr/sbin/yast2

# ./yast-test.rb <(echo -n Hello)

require "yast"
require "ui/dialog"
Yast.import "Label"
Yast.import "UI"

i = 0
if Yast::WFM::Args(i).to_s.include?("rtl")
  Yast::UI.SetLanguage("ar_EG") # enables RTL UI layout
  i += 1
end

filename = Yast::WFM::Args(i)
if filename
  $thelabel = File.read(filename)
else
  raise "Usage: yast-test file-with-text"
end

class TestDialog < UI::Dialog
  def dialog_content
    VBox(
      widgets($thelabel),
      HBox(
        PushButton(Id(:ok), Yast::Label.OKButton),
        PushButton(Id(:cancel), Yast::Label.CancelButton)
      )
    )
  end

  def widgets(label)
    VBox(
      RichText(label),
      Label(label),
      RadioButton(label),
      PushButton(label)
    )
  end

  def ok_handler
    finish_dialog(:next)
  end
end

TestDialog.new.run
