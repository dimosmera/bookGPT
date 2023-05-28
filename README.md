# AI search & chat for books

Using OpenAI's APIs (embeddings and GPT-3), we can search through large PDFs and ask questions about them.

The results remind me of The Librarian from [Snow Crash](https://en.wikipedia.org/wiki/Snow_Crash) - an AI-powered super-machine that lives in a library capable of accessing and summarising large quantities of text.

Try it out [here](https://book-gpt-pied.vercel.app/)

## Setup

### Generating embeddings

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

### Deploying the API

The backend accepts a question and returns the answer. It's a serverless lambda that runs on AWS.

1. Install the [Serverless Framework](https://www.serverless.com/framework/docs/getting-started)

If you haven't already, you'll need to [set up your AWS credentials](https://www.serverless.com/framework/docs/providers/aws/guide/credentials/).

2. Deploy the API:

```
cd backend
npm run deploy
```

### Hosting the frontend

The frontend is written with React and Next.js. You can host it anywhere you like. I prefer [Vercel](https://vercel.com/dashboard).

To run locally, `cd frontend` and:

1. Fetch dependencies:

```
yarn or npm install
```

2. Run the development server:

```
 yarn dev or npm run dev
```
