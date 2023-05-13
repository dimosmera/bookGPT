require 'pdf-reader'

require_relative 'count_tokens'

CHUNK_SIZE = 8192

# Splits a PDF into chunks so we can compute embeddings for each
def extract_chunks
  reader = PDF::Reader.new('./file.pdf')

  chunk = ''
  chunks = []

  reader.pages.each do |page|
    # Grab each line ignoring empty ones
    lines = page.text.scan(/^.+/)

    lines.each do |line|
      line_tokens = count_tokens(line)
      chunk_tokens = count_tokens(chunk)

      if chunk_tokens + line_tokens < CHUNK_SIZE
        chunk += "#{line} "
      else
        chunks << chunk
        chunk = line
      end
    end
  end

  chunks << chunk
  chunk = ''

  chunks
end
