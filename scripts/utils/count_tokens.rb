# Counts the number of tokens in a string
# According to OpenAI, a helpful rule of thumb is that one token generally corresponds to ~4 characters of text - https://platform.openai.com/tokenizer
# To be on the safe side and not to exceed the limit, we will use 3 characters per token
# TODO: Create a node (gpt-3-encoder) or python (tiktoken) API and query that to get a more precise token count
def count_tokens(text)
  text.length / 3
end
