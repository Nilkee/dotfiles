(import-macros {: map!} :hibiscus.vim)

;; Window resizing
(map! [n] :<A-h> :<CMD>SmartResizeLeft<CR>)
(map! [n] :<A-j> :<CMD>SmartResizeDown<CR>)
(map! [n] :<A-k> :<CMD>SmartResizeUp<CR>)
(map! [n] :<A-l> :<CMD>SmartResizeRight<CR>)

;; Window movement between splits
(map! [n] :<C-h> :<CMD>SmartCursorMoveLeft<CR>)
(map! [n] :<C-j> :<CMD>SmartCursorMoveDown<CR>)
(map! [n] :<C-k> :<CMD>SmartCursorMoveUp<CR>)
(map! [n] :<C-l> :<CMD>SmartCursorMoveRight<CR>)

{1 :mrjones2014/smart-splits.nvim}
