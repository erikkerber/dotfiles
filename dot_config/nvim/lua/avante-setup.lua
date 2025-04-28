-- vim.g.plenary_curl_bin_path = "/usr/local/bin/slack-uberproxy-curl"

require("avante").setup({
  ---@alias Provider "openai" | "claude" | "azure"  | "copilot" | [string]
  -- provider = "perplexity",
  provider = "claude",
    vendors = {
    ---@type AvanteProvider
    perplexity = {
        -- endpoint = "https://lmnsdnvjhmk5kgxktueuic4dci0zzuzw.lambda-url.us-east-1.on.aws/api/v1",
        endpoint = "https://devxp-ai-api.tinyspeck.com/v1/chat/",
        model = "claude_3.5_sonnet",
        api_key_name = "SLACK_AI_API_KEY",
        --- this function below will be used to parse in cURL arguments.
        parse_curl_args = function(opts, code_opts)
            return {
                url = opts.endpoint,
                headers = {
                    ["Accept"] = "application/json",
                    ["Content-Type"] = "application/json",
                },
                body = {
                    model = opts.model,
                    messages = require("avante.providers").claude.parse_message(code_opts), 
                    temperature = 0.5,
                    max_tokens = 4096,
                    source = "curl",
                    stream = 1, -- this will be set by default.
                },
            }
        end,
        -- The below function is used if the vendors has specific SSE spec that is not claude or openai.
        -- parse_response_data = function(data_stream, event_state, opts)
        --     print("Ho")
        --     require("avante.providers").claude.parse_response(data_stream, event_state, opts)
        -- end,
        -- parse_stream_data = function(data, handler_opts)            print("Ho")
        --     require("avante.providers").claude.parse_stream(data, handler_opts)
        -- end,
    },
  },
  mappings = {
    ask = "<leader>aa",
    edit = "<leader>ae",
    refresh = "<leader>ar",
    --- @class AvanteConflictMappings
    diff = {
      ours = "co",
      theirs = "ct",
      none = "c0",
      both = "cb",
      next = "]x",
      prev = "[x",
    },
    jump = {
      next = "]]",
      prev = "[[",
    },
    submit = {
      normal = "<CR>",
      insert = "<C-s>",
    },
    toggle = {
      debug = "<leader>ad",
      hint = "<leader>ah",
    },
  },
  hints = { enabled = true },
  windows = {
    wrap = true, -- similar to vim.o.wrap
    width = 30, -- default % based on available width
    sidebar_header = {
      align = "center", -- left, center, right for title
      rounded = true,
    },
  },
  highlights = {
    ---@type AvanteConflictHighlights
    diff = {
      current = "DiffText",
      incoming = "DiffAdd",
    },
  },
  --- @class AvanteConflictUserConfig
  diff = {
    debug = false,
    autojump = true,
    ---@type string | fun(): any
    list_opener = "copen",
  },
})
