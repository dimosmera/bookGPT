## Setup

First, you need to generate embeddings for your PDF.

1. `cd scripts`

2. Create and fill in `.environment.rb` using `.environment.rb.sample` as an example

3. [Install Ruby](https://www.ruby-lang.org/en/documentation/installation/) if you haven't done so already

4. Install the needed gems:

```
bundle install
```

5. Turn your PDF into embeddings for GPT-3:

```
ruby pdf_to_embeddings.rb
```

Note: Make sure to `cd` into the `scripts` directory before running the script.
