local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

-- Keybindings
-- gc count + motion <- comment a region (line comment)
-- gc count + motion <- comment a region (block comment)
-- gcc <-  comment a whole line (line comment)
-- gcc <-  comment a whole line (block comment)
--
-- Extra keys:
-- gco <- comment current line an open a new line in insert mode
-- gcO <- ... open a new line in the above line
-- gcA
comment.setup({
	pre_hook = function(ctx)
		local U = require("Comment.utils")

		local location = nil
		if ctx.ctype == U.ctype.block then
			location = require("ts_context_commentstring.utils").get_cursor_location()
		elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
			location = require("ts_context_commentstring.utils").get_visual_start_location()
		end

		return require("ts_context_commentstring.internal").calculate_commentstring({
			key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
			location = location,
		})
	end,
})
