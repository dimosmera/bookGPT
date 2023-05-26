import NextHead from "next/head";

const AppHead = () => {
  return (
    <NextHead>
      <title>Ask a book</title>
      <meta
        name="description"
        content="Ask questions to a book. Powered by ChatGPT"
      />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="icon" href="/favicon.ico" />
    </NextHead>
  );
};

export default AppHead;
