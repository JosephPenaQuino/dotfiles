require("CopilotChat").setup {
  prompts = {
    Pytest = {
      prompt = '/COPILOT_GENERATE Please generate pytest tests for my code. Try to use parametrize if possible.',
    },
  }
}
