#!/usr/sbin/yast2
# coding: utf-8

# This tool is useful for making screenshots of just the labels:
# ./yast-label.rb "مرحبا"

require "yast"
Yast.import "UI"
include Yast::UIShortcuts

text = Yast::WFM::Args(0) || "مرحبا"

Yast::UI.SetLanguage(ENV["LANG"])
Yast::UI.OpenDialog(Label(text))
Yast::UI.UserInput
Yast::UI.CloseDialog
