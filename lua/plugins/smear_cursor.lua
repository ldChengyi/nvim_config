return {
	"sphamba/smear-cursor.nvim",
	opts = {
		smear_between_buffers = true,
		smear_between_neighbor_lines = true,
		scroll_buffer_space = true,
		legacy_computing_symbols_support = false,

		-- 拖尾更长、更明显
		stiffness = 0.8,                  -- 默认 0.8,调低 → 头部跟随更软
		trailing_stiffness = 0.4,         -- 默认 0.5,调低 → 尾巴拖更长
		trailing_exponent = 0.1,          -- 尾巴衰减更平缓
		distance_stop_animating = 0.7,    -- 调小 → 小幅移动也画拖尾
		matrix_pixel_threshold = 0.3,     -- 拖尾绘制阈值,调低 → 尾巴更连续
	},
}
