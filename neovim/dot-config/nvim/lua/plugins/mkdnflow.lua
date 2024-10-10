return {
  "jakewvincent/mkdnflow.nvim",
  opts = {
    mappings = {
      MkdnEnter = { { 'n', 'v' }, '<CR>' },
      MkdnTab = false,
      MkdnSTab = false,
      MkdnNextLink = { 'n', ']l' },
      MkdnPrevLink = { 'n', '[l' },
      MkdnNextHeading = { 'n', ']h' },
      MkdnPrevHeading = { 'n', '[h' },
      MkdnGoBack = false,
      MkdnGoForward = false,
      MkdnCreateLink = false,              -- see MkdnEnter
      MkdnCreateLinkFromClipboard = false, -- see MkdnEnter
      MkdnFollowLink = false,              -- see MkdnEnter
      MkdnDestroyLink = false,
      MkdnTagSpan = false,
      MkdnMoveSource = false,
      MkdnYankAnchorLink = { 'n', 'yaa' },
      MkdnYankFileAnchorLink = { 'n', 'yfa' },
      MkdnIncreaseHeading = false,
      MkdnDecreaseHeading = { 'n', '+' },
      MkdnToggleToDo = { { 'n', 'v' }, '<C-Space>' },
      MkdnNewListItem = false,
      MkdnNewListItemBelowInsert = { 'n', 'o' },
      MkdnNewListItemAboveInsert = { 'n', 'O' },
      MkdnExtendList = false,
      MkdnUpdateNumbering = { 'n', '<leader>nn' },
      MkdnTableNextCell = false,
      MkdnTablePrevCell = false,
      MkdnTableNextRow = false,
      MkdnTablePrevRow = false,
      MkdnTableNewRowBelow = false,
      MkdnTableNewRowAbove = false,
      MkdnTableNewColAfter = false,
      MkdnTableNewColBefore = false,
      MkdnFoldSection = false,
      MkdnUnfoldSection = false
    }
  }
}
