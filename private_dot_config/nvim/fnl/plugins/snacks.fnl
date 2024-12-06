(local header "____________/\\\\\\_________________________________        
 __________/\\\\\\\\\\_________________________________       
  ________/\\\\\\/\\\\\\_________________________________      
   ______/\\\\\\/\\/\\\\\\_____/\\\\\\\\\\\\\\\\\\_____/\\\\\\\\\\\\\\\\\\\\\\_     
    ____/\\\\\\/__\\/\\\\\\____\\////////\\\\\\___\\///////\\\\\\/__    
     __/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\___/\\\\\\\\\\\\\\\\\\\\_______/\\\\\\/____   
      _\\///////////\\\\\\//___/\\\\\\/////\\\\\\_____/\\\\\\/______  
       ___________\\/\\\\\\____\\//\\\\\\\\\\\\\\\\/\\\\__/\\\\\\\\\\\\\\\\\\\\\\_ 
        ___________\\///______\\////////\\//__\\///////////__")

{1 :folke/snacks.nvim
 :priority 1000
 :lazy false
 :opts {:bigfile {:enabled true}
        :dashboard {:preset {: header
                             :keys [{:action ":lua Snacks.dashboard.pick('files')"
                                     :desc "Find File"
                                     :icon " "
                                     :key :f}
                                    {:action ":ene | startinsert"
                                     :desc "New File"
                                     :icon " "
                                     :key :n}
                                    {:action ":lua Snacks.dashboard.pick('live_grep')"
                                     :desc "Find Text"
                                     :icon " "
                                     :key :g}
                                    {:action ":lua Snacks.dashboard.pick('oldfiles')"
                                     :desc "Recent Files"
                                     :icon " "
                                     :key :r}
                                    {:action ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})"
                                     :desc :Config
                                     :icon " "
                                     :key :c}
                                    ; {:desc "Restore Session"
                                    ;  :icon " "
                                    ;  :key :s
                                    ;  :section :session}
                                    {:action ":Lazy"
                                     :desc :Lazy
                                     :enabled (not= package.loaded.lazy nil)
                                     :icon "󰒲 "
                                     :key :L}
                                    {:action ":qa"
                                     :desc :Quit
                                     :icon " "
                                     :key :q}]}
                    :sections [{:section :header}
                               {:section :keys :gap 1 :padding 1}
                               {:section :startup :padding 1}
                               {:section :terminal
                                :cmd "pokemon-colorscripts -r --no-title; sleep .1"
                                :random 10
                                :height 30}]}}}
