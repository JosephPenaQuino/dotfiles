-- Function to check if a systemctl process is running
function IsSystemctlProcessRunning(service_name)
  -- Command to check the status of the service
  local command = "systemctl is-active " .. service_name

  -- Execute the command
  local handle = io.popen(command)
  local result = handle:read("*a")
  handle:close()

  -- Trim any leading or trailing whitespace
  result = vim.trim(result)

  -- Check if the service is active
  if result == "active" then
    return true
  else
    return false
  end
end


if vim.loop.fs_stat("/usr/local/bin/ollama") ~= nil and vim.env.NVIM_LLM ~= nil and not IsSystemctlProcessRunning("ollama") then
    require("avante_lib").load()
    require("avante").setup({
        provider = "ollama",
        auto_suggestions_provider = "ollama",
          behaviour = {
            auto_suggestions = true, -- Experimental stage
            auto_set_highlight_group = true,
            auto_set_keymaps = true,
            auto_apply_diff_after_generation = false,
            support_paste_from_clipboard = false,
          },
        vendors = {
            ---@type AvanteProvider
            ollama = {
                ["local"] = true,
                endpoint = "127.0.0.1:11434/v1",
                model = vim.env.NVIM_LLM,
                parse_curl_args = function(opts, code_opts)
                    return {
                        url = opts.endpoint .. "/chat/completions",
                        headers = {
                            ["Accept"] = "application/json",
                            ["Content-Type"] = "application/json",
                        },
                        body = {
                            model = opts.model,
                            messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
                            max_tokens = 2048,
                            stream = true,
                        },
                    }
                end,
                parse_response_data = function(data_stream, event_state, opts)
                    require("avante.providers").openai.parse_response(data_stream, event_state, opts)
                end,
            },
        },
    })
end
