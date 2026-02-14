-- Officaial Tips
-- https://yazi-rs.github.io/docs/tips/#smart-enter
--
-- Show symlink in status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- when it detects that you're using Yazi in nvim, the preview is hidden by default
if os.getenv("NVIM") then
	require("toggle-pane"):entry("min-preview")
end

-- https://github.com/yazi-rs/plugins/tree/main/git.yazi
require("git"):setup {
	-- Order of status signs showing in the linemode
	order = 1500,
}
