---@type NvPluginSpec
return {
  "David-Kunz/gen.nvim",
  cmd = "Gen",
  opts = {
    model = "llama3.1", -- The default model to use.
    host = "t430.abl", -- The host running the Ollama service.
    port = "8080", -- The port on which the Ollama service is listening.
    init = function() end,
    -- display_mode = "horizontal-split",
    -- no_auto_close = true,
    -- show_prompt = true,
    show_model = true,
    prompts = {
      DeepSeekCoder = {
        prompt = "```$input in language $filetype\n$text\n```",
        model = "deepseek-coder-v2",
      },
      Lllama = {
        prompt = "```$text\n$input\n```",
        model = "llama3.1",
      },
      LllamaCode = {
        prompt = "```$input in language $filetype\n$text\n```",
        model = "llama3.1",
      },
      -- Summarize = { prompt = "Summarize the following text:\n$text" },
      -- Enhance_Grammar_Spelling = {
      --   prompt = "Modify the following text to improve grammar and spelling, just output the final text without additional quotes around it:\n$text",
      --   replace = true,
      -- },
      -- Enhance_Wording = {
      --   prompt = "Modify the following text to use better wording, just output the final text without additional quotes around it:\n$text",
      --   replace = true,
      -- },
      -- Make_Concise = {
      --   prompt = "Modify the following text to make it as simple and concise as possible, just output the final text without additional quotes around it:\n$text",
      --   replace = true,
      -- },
      -- Make_List = {
      --   prompt = "Render the following text as a markdown list:\n$text",
      --   replace = true,
      -- },
      -- Make_Table = {
      --   prompt = "Render the following text as a markdown table:\n$text",
      --   replace = true,
      -- },
      -- Review_Code = {
      --   prompt = "Review the following code and make concise suggestions:\n```$filetype\n$text\n```",
      -- },
      -- Enhance_Code = {
      --   prompt = "Enhance the following code, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      --   replace = true,
      --   extract = "```$filetype\n(.-)```",
      -- },
      -- Change_Code = {
      --   prompt = "Regarding the following code, $input, only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```",
      --   replace = true,
      --   extract = "```$filetype\n(.-)```",
      -- },
    },
  },
}
