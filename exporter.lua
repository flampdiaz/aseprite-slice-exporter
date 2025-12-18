local utils = require "utils"
local exporter = {}

-- Pure export logic (no dialogs)
-- spr: Sprite
-- outDir: string (folder)
-- pattern: string (e.g. "{slice}.png")
-- onlyCurrentFrame: boolean
-- returns: exportedCount (number)
function exporter.exportSlicesToPngs(spr, outDir, pattern, onlyCurrentFrame)
  if not spr then
    utils.showError("No active sprite open.")
    return 0
  end
  if not spr.slices or #spr.slices == 0 then
    utils.showError("This sprite has no slices.")
    return 0
  end
  if not outDir or outDir == "" then
    utils.showError("Choose an output folder.")
    return 0
  end
  if not pattern or pattern == "" then
    pattern = "{slice}.png"
  end

  -- Decide frame to render
  local frameNumber = app.activeFrame and app.activeFrame.frameNumber or 1

  -- Render the sprite (current frame) into an in-memory image
  -- This avoids SaveFileCopyAs(slice=...) issues (empty/duplicate output).
  local full = Image(spr.width, spr.height)
  full:drawSprite(spr, frameNumber)

  local exported = 0

  for _, sl in ipairs(spr.slices) do
    local name = sl.name
    if name and name ~= "" then
      local b = sl.bounds
      if b.width > 0 and b.height > 0 then
        local fileName = pattern:gsub("{slice}", utils.sanitizeFilename(name))
        local fullPath = app.fs.joinPath(outDir, fileName)

        local img = Image(b.width, b.height)
        -- Copy pixels from full render: shift so slice top-left becomes (0,0)
        img:drawImage(full, Point(-b.x, -b.y))

        img:saveAs(fullPath)
        exported = exported + 1
      end
    end
  end

  return exported
end

return exporter
