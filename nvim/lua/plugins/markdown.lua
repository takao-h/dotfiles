return {
  {
    -- 依存プラグイン
    "godlygeek/tabular",
  },
  {
    "preservim/vim-markdown",
    dependencies = { "godlygeek/tabular" },
    ft = { "markdown" }, -- Markdown を開いたときだけ読み込む
    init = function()
      -- 好みでオプションを設定（例）
      -- 折りたたみを無効化
      vim.g.vim_markdown_folding_disabled = 1
      -- ストライクスルー有効化
      vim.g.vim_markdown_strikethrough = 1
      -- JSON front matter ハイライト
      vim.g.vim_markdown_json_frontmatter = 1
    end,
  },
}
