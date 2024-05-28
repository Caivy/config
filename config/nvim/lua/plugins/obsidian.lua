return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = false,
  -- enable = false,
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    -- "BufReadPre "
    --   .. vim.fn.expand("~")
    --   .. "/Documents/personal/Obsidian/Second Brain/**.md",
    -- "BufNewFile " .. vim.fn.expand("~") .. "/Documents/personal/Obsidian/Second Brain/**.md",
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "Second Brain",
        path = "",
        overrides = {
          notes_subdir = "1 - Inbox",
        },
      },
    },
    disable_frontmatter = true,
    note_id_func = function(title)
      -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
      -- In this case a note with the title 'My new note' will be given an ID that looks
      -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
      -- local suffix = ""
      -- if title ~= nil then
      --   -- If title is given, transform it into valid file name.
      --   suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      -- else
      --   -- If title is nil, just add 4 random uppercase letters to the suffix.
      --   for _ = 1, 4 do
      --     suffix = suffix .. string.char(math.random(65, 90))
      --   end
      -- end
      return tostring(title)
    end,
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
    },
    templates = {
      subdir = "3 - Template",
      date_format = "%d-%m-%Y",
      time_format = "%H:%M",
      substitutions = {
        time24 = function()
          return os.date("%H:%M:%S")
        end,
        time12 = function()
          -- Conversion to 12-hour format with AM/PM
          local hour = tonumber(os.date("%H"))
          local ampm = hour >= 12 and "PM" or "AM"
          hour = hour % 12
          hour = hour == 0 and 12 or hour
          return string.format("%02d:%s %s", hour, os.date("%M:%S"), ampm)
        end,
        year = function()
          return os.date("%Y", os.time())
        end,
        month = function()
          return os.date("%B", os.time())
        end,
        yesterday = function()
          return os.date("%Y-%m-%d", os.time() - 86400)
        end,
        nextday = function()
          return os.date("%Y-%m-%d", os.time() + 86400)
        end,
        hdate = function()
          return os.date("%A, %B %d, %Y")
        end,
        rfc3339 = function()
          return os.date("!%Y-%m-%dT%H:%M:%SZ")
        end,
        week = function()
          return os.date("%V", os.time())
        end,
        isoweek = function()
          return os.date("%G-W%V", os.time())
        end,
        isoprevweek = function()
          local adjustment = -7 * 24 * 60 * 60 -- One week in seconds
          return os.date("%G-W%V", os.time() + adjustment)
        end,
        isonextweek = function()
          local adjustment = 7 * 24 * 60 * 60 -- One week in seconds
          return os.date("%G-W%V", os.time() + adjustment)
        end,
        day_of_month = function()
          return os.date("%d", os.time())
        end,
        month_numeric = function()
          return os.date("%m", os.time())
        end,
        weekday = function()
          return os.date("%A", os.time())
        end,
      },
    },
    -- key mappings, below are the defaults
    mappings = {
      -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
      ["<leader>oc"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- toggle check-boxes
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    new_notes_location = "current_dir",
    ui = {
      enable = true, -- set to false to disable all additional syntax features
      update_debounce = 200, -- update delay after a text change (in milliseconds)
      -- Define how various check-boxes are displayed
      checkboxes = {
        -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
        [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
        ["x"] = { char = "", hl_group = "ObsidianDone" },
        [">"] = { char = "", hl_group = "ObsidianRightArrow" },
        ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
        -- Replace the above with this if you don't have a patched font:
        -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
        -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

        -- You can also add more custom ones...
      },
      -- Use bullet marks for non-checkbox lists.
      bullets = { char = "•", hl_group = "ObsidianBullet" },
      external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      -- Replace the above with this if you don't have a patched font:
      -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
      reference_text = { hl_group = "ObsidianRefText" },
      highlight_text = { hl_group = "ObsidianHighlightText" },
      tags = { hl_group = "ObsidianTag" },
      block_ids = { hl_group = "ObsidianBlockID" },
      hl_groups = {
        -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
        ObsidianTodo = { bold = true, fg = "#f78c6c" },
        ObsidianDone = { bold = true, fg = "#89ddff" },
        ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
        ObsidianTilde = { bold = true, fg = "#ff5370" },
        ObsidianBullet = { bold = true, fg = "#89ddff" },
        ObsidianRefText = { underline = true, fg = "#c792ea" },
        ObsidianExtLinkIcon = { fg = "#c792ea" },
        ObsidianTag = { italic = true, fg = "#89ddff" },
        ObsidianBlockID = { italic = true, fg = "#89ddff" },
        ObsidianHighlightText = { bg = "#75662e" },
      },
    },
  },
}
