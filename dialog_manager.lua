local exporter = require "exporter"
local utils = require "utils"

local dialogManager = {}

function dialogManager.showExportDialog()
  local spr = app.activeSprite
  if not spr then return utils.showError("No active sprite open.") end

  local dlg = Dialog("Export Slices as PNGs")

  dlg:file{
    id="outDir",
    label="Output folder",
    filename=app.fs.userDocsPath or "",
    open=false,
    save=false
  }

  dlg:entry{
    id="pattern",
    label="Filename pattern",
    text="{slice}.png"
  }

  dlg:check{
    id="onlyCurrentFrame",
    label="Only current frame",
    selected=true
  }

  dlg:button{
    id="export",
    text="Export",
    onclick=function()
      local data = dlg.data
      
      -- app.fs.filePath returns the directory part of the path
      local outDir = app.fs.filePath(data.outDir)
      
      local exported = exporter.exportSlicesToPngs(
        spr,
        outDir,
        data.pattern,
        data.onlyCurrentFrame
      )
      
      if exported > 0 then
          app.alert("Exported " .. exported .. " slice PNG(s).")
          dlg:close()
      end
    end
  }

  dlg:button{ id="cancel", text="Cancel" }
  dlg:show{ wait=false }
end

return dialogManager
