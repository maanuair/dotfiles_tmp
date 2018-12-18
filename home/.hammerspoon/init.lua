local utils = require('utils')
local jira = require('jira')
local confluence = require('confluence')
local oblique_strategies = require('oblique_strategies')
local log = hs.logger.new('init.lua', 'debug')

-- Starts fresh
hs.console.setConsole()
log.i("Fresh Hammerspoon's config loaded !")

-- Inits for key bindings...
local myModifiers = {"cmd", "alt", "ctrl"}
local myModifiersShift = {"cmd", "alt", "ctrl", "shift"}

-- General hot keys
hs.hotkey.showHotkeys(myModifiers, "H")
hs.hotkey.bind(myModifiers,      "D", "Dictionary: define highlighted selection (or ask)", utils.openDict)
hs.hotkey.bind(myModifiers,      "G", "Google: google the highlighted selection", utils.googleSelection)

-- JIRA hot keys
hs.hotkey.bind(myModifiers, 	   "B", "JIRA: Type a bug template", jira.typeBugTemplate)
hs.hotkey.bind(myModifiers, 	   "O", "JIRA: Immediate or interactive JIRA issue lookup", jira.browseIssue)
hs.hotkey.bind(myModifiers, 	   "J", "JIRA: Search highlighted selection", jira.search)
hs.hotkey.bind(myModifiersShift, "J", "JIRA: type URL for highlighted issue", jira.typeBrowseUrl)

-- Confluence hot keys
hs.hotkey.bind(myModifiers,      "C", "Confluence: Search highlighted selection", confluence.search)
-- hs.hotkey.bind(myModifiers,   "E", "Confluence: Add an Epic in Product space.", confluence.addEpic)

-- Oblique Strategies hot keys
hs.hotkey.bind(myModifiersShift, "O", "Show an Oblique Strategy", oblique_strategies.showStrategy)

-- Timer attempts

function remind()
  hs.notify.new({
    title = "Reminder",
	  informativeText = "Don't you remind ?\nTTD + PPL + MPC!",
  }):send()
end
a = hs.fs.attributes('~/.hammerspoon.timer')
if a == nil then
  log.df("No timer set.")
else
  hs.hotkey.bind(myModifiers, 	"R", "Reminder", remind)
  hs.timer.doEvery(60*15 , remind)
  log.df("Reminder timer is set.")
  remind()
end
