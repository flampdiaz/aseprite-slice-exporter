local utils = {}

function utils.showError(msg)
  app.alert{ title="Export Slices", text=msg }
end

function utils.sanitizeFilename(name)
  -- Safe across macOS/Windows
  return (name:gsub("[/\\:%*%?\"%<%>%|]", "_"))
end

return utils
