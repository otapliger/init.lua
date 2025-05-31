M = {}

local count = function(severity)
  if not rawget(vim, "lsp") then
    return 0
  end

  return vim.diagnostic.count(0, { serverity = severity })[severity] or 0
end

M.mode = function()
  local modes = {
    ["n"] = "N",
    ["v"] = "V",
    ["V"] = "V",
    ["s"] = "S",
    ["S"] = "S",
    ["i"] = "I",
    ["R"] = "R",
    ["c"] = "C",
    [""] = "V",
    [""] = "S",
    ["no"] = "N",
    ["ic"] = "I",
    ["Rv"] = "R",
    ["!"] = "SHELL",
    ["r"] = "PROMPT",
    ["t"] = "TERMINAL",
    ["r?"] = "CONFIRM",
    ["rm"] = "MOAR",
    ["cv"] = "EX",
    ["ce"] = "EX",
  }

  local mode = " " .. modes[vim.api.nvim_get_mode().mode]
  return mode or "UNKNOWN"
end

M.filename = function()
  local file = vim.fn.expand("%:.")

  if file == "" then
    file = "[no name]"
  end

  if string.match(file, "neo.tree filesystem") then
    file = ""
  end

  return file
end

M.filetype = function()
  if vim.bo.filetype == nil or vim.bo.filetype == '' then
    return ""
  end

  return "ft:" .. vim.bo.filetype .. " "
end

M.modified = function()
  return vim.bo.modified and "*" or ""
end

M.branch = function()
  local branch = vim.g.gitsigns_head
  local no_branch = "[no branch]"

  if branch == nil then
    return " " .. no_branch
  end

  if branch ~= "" then
    if string.len(branch) > 20 then
      branch = branch:sub(1, 20) .. "..."
    end

    return " " .. branch
  end

  return " " .. no_branch
end

M.changes = function()
  local statuses = vim.b.gitsigns_status_dict
  local changed = 0
  local added = 0
  local removed = 0

  if statuses ~= nil then
    changed = statuses.changed or 0
    added = statuses.added or 0
    removed = statuses.removed or 0
  end

  return "%#GitSignsChange# ~" .. changed .. "%#GitSignsAdd# +" .. added .. "%#GitSignsDelete# -" .. removed .. " "
end

M.infos = function()
  local info_count = count(vim.diagnostic.severity.INFO)

  if info_count > 0 then
    return "%#DiagnosticSignInfo# " .. info_count
  end

  return ""
end

M.errors = function()
  local error_count = count(vim.diagnostic.severity.ERROR)

  if error_count > 0 then
    return "%#DiagnosticSignError# " .. error_count
  end

  return ""
end

M.warnings = function()
  local warning_count = count(vim.diagnostic.severity.WARN)

  if warning_count > 0 then
    return "%#DiagnosticSignWarn# " .. warning_count .. " "
  end

  return ""
end

return M
