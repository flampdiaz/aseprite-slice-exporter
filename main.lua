local dialogManager = require "dialog_manager"

function init(plugin)
  plugin:newCommand{
    id="ExportSlicesAsPNGs",
    title="Export Slices as PNGs...",
    group="file_export",
    onclick=function()
      dialogManager.showExportDialog()
    end
  }
end

function exit(plugin) end
