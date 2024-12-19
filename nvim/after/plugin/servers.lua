local mason = require("mason")

mason.setup({
  max_concurrent_installers = 30,
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    },
    keymaps = {
      toggle_package_expand = "<cr>",
      install_package = "i",
      update_package = "u",
      check_package_version = "c",
      update_all_packages = "U",
      check_outdated_packages = "C",
      uninstall_package = "<bs>",
      cancel_installation = "<C-c>",
      apply_language_filter = "<C-f>",
      toggle_package_install_log = "<cr>",
      toggle_help = "?",
    },
  }
})
