local components = require("statusline.components")

local get_component = function(tag, value)
  if value == "" then
    return ""
  end
  return "%#" .. tag .. "# " .. value
end

function StatusLine()
  return table.concat({
    get_component("StatusMode", components.mode()),
    get_component("StatusGitBranch", components.branch()),
    get_component("StatusGitChanges", components.changes()),
    get_component("StatusModified", components.modified()),
    get_component("StatusFile", components.filename()),

    -- Separator
    "%=",

    get_component("StatusInfos", components.infos()),
    get_component("StatusErrors", components.errors()),
    get_component("StatusWarnings", components.warnings()),
    get_component("StatusType", components.filetype()),
  })
end

vim.o.laststatus = 3
vim.o.statusline = "%!v:lua.StatusLine()"
