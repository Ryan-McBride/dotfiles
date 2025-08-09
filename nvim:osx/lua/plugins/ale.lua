return {
  "dense-analysis/ale",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local g = vim.g

    g.ale_lint_on_text_changed = "never"
    g.ale_lint_on_insert_leave = 1
    g.ale_lint_on_save = 1 

    g.ale_javascript_eslint_use_global = 1
    g.ale_typescript_eslint_use_global = 1

    g.ale_javascript_eslint_executable = "eslint_d"
    g.ale_typescript_eslint_executable = "eslint_d"

    g.ale_linters = {
      javascript         = { "eslint" },
      javascriptreact    = { "eslint" },
      typescript         = { "eslint" },
      typescriptreact    = { "eslint" },
      python             = { "ruff", "mypy" },
    }

    g.ale_fixers = {
      javascript         = { "eslint" },
      javascriptreact    = { "eslint" },
      typescript         = { "eslint" },
      typescriptreact    = { "eslint" },
      python             = { "ruff" },
    }

    g.ale_echo_cursor = 1
    g.ale_virtualtext = 1

    g.ale_sign_error = "💀"
    g.ale_sign_warning = "🧀"
  end
}
