return {
  "goolord/alpha-nvim",
  config = function()
    local fn = vim.fn
    local marginTopPercent = 0.3
    local headerPadding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

    local header = {
      type = "text",
      val = {
        [[          .                                                      .          ]],
        [[        .n                   .                 .                  n.        ]],
        [[  .   .dP                  dP                   9b                 9b.    .  ]],
        [[ 4    qXb         .       dX                     Xb       .        dXp     t ]],
        [[dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb]],
        [[9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP]],
        [[ 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP ]],
        [[  `9XXXXXXXXXXXXXXXXXXXXX'~   ~`OOO8b   d8OOO'~   ~`XXXXXXXXXXXXXXXXXXXXXP'  ]],
        [[    `9XXXXXXXXXXXP' `9XX    000    `98v8P'    000   `XXP' `9XXXXXXXXXXXP'    ]],
        [[        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~        ]],
        [[                        )b.  .dbo.dP'`v'`9b.odb.  .dX(                        ]],
        [[                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                       ]],
        [[                     dXXXXXXXXXXXP'   .   `9XXXXXXXXXXXb                      ]],
        [[                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                     ]],
        [[                    9XXb'   `XXXXXb.dX|Xb.dXXXXX'   `dXXP                     ]],
        [[                     `'      9XXXXXX(   )XXXXXXP      `'                      ]],
        [[                              XXXX X.`v'.X XXXX                              ]],
        [[                              XP^X'`b   d'`X^XX                              ]],
        [[                              X. 9  `   '  P )X                              ]],
        [[                              `b  `       '  d'                              ]],
        [[                               `             '                               ]],
      },
      opts = {
        hl = "DashboardHeader",
        position = "center",
      },
    }

    local config = {
      layout = {
        { type = "padding", val = headerPadding },
        header,
        { type = "button",  val = "" },
      },
      opts = {
        setup = function()
          vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#00FF00", bold = true })
          vim.cmd("autocmd FileType alpha setlocal nofoldenable")
        end,
      },
    }
    require("alpha").setup(config)
  end,
}
