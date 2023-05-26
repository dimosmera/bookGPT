import NextHead from "next/head";

const AppHead = () => {
  return (
    <NextHead>
      <title>Ask A Book: I Have No Mouth, and I Must Scream</title>
      <meta
        name="description"
        content="Ask questions to a book. Powered by ChatGPT"
      />
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <link rel="icon" href="/favicon.svg" />
    </NextHead>
  );
};

export default AppHead;
