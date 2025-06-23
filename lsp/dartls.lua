local dartExcludedFolders = {
  vim.fn.expand("$HOME/AppData/Local/Pub/Cache"),
  vim.fn.expand("$HOME/.pub-cache"),
  vim.fn.expand("/opt/homebrew/"),
  vim.fn.expand("$HOME/tools/flutter/"),
}

return {
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  root_markers = { "pubspec.yaml" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  settings = {
    dart = {
      analysisExcludedFolders = dartExcludedFolders,
      enableSdkFormatter = true,
      updateImportsOnRename = true,
      completeFunctionCalls = true,
      showTodos = false,
    },
  },
}
