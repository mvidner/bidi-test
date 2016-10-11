#!/usr/sbin/yast2
# coding: utf-8

# ./yast-test.rb <(echo -n Hello)

require "yast"
require "ui/dialog"
Yast.import "Label"
Yast.import "UI"

class TestDialog < UI::Dialog
  def initialize(text)
    @direction = :ltr
    @text = text
  end

  def flip_widget
    label = (@direction == :ltr) ? "Make Right to Left" : "Make Left to Right"
    PushButton(Id(:flip), label)
  end

  def dialog_content
    VBox(
      InputField(Id(:text), Opt(:notify), "Enter a text"),
      PushButton(Id(:file), "Text from a file"),

      VSpacing(1),
      ReplacePoint(Id(:rsample), sample_widgets),
      VSpacing(1),

      ReplacePoint(Id(:rflip), flip_widget),
      HBox(
        PushButton(Id(:close), Yast::Label.CloseButton)
      )
    )
  end

  def sample_widgets
    box = VBox(
      RichText(@text),
      Label(@text),
      RadioButton(@text),
      PushButton(@text)
    )
    Frame("Sample widgets with that text", box)
  end

  def flip_handler
    if @direction == :ltr
      @direction = :rtl
      lang = "ar_EG" # enables RTL UI layout
    else
      @direction = :ltr
      lang = "en_US"
    end
    Yast::UI.ReplaceWidget(Id(:rflip), flip_widget)
    Yast::UI.SetLanguage(lang)
  end

  def text_handler
    @text = Yast::UI.QueryWidget(Id(:text), :Value)
    Yast::UI.ReplaceWidget(Id(:rsample), sample_widgets)
  end

  def file_handler
    file = Yast::UI.AskForExistingFile(".", "*", "Choose a File")
    return unless file
    @text = File.read(file).strip
    Yast::UI.ReplaceWidget(Id(:rsample), sample_widgets)
  end

  def close_handler
    finish_dialog(:next)
  end
end

text = Yast::WFM::Args(0) || "مرحبا"
TestDialog.new(text).run
