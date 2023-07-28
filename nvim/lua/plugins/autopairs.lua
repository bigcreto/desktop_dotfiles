return {
  {
    "windwp/nvim-autopairs",
    config = function()
      -- Protected call Autopairs.
      local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
      if not autopairs_status then
        return
      end

      -- Protected call CMP.
      local cmp_status, cmp = pcall(require, "cmp")
      if not cmp_status then
        return
      end

      -- Protected call CMP Autopairs
      local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
      if not cmp_autopairs_status then
        return
      end

      -- Autopairs setup
      autopairs.setup({
        check_ts = true,
        ts_config ={},
      })

      cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done() )

    end,
  },
}
