import { useMutation } from "react-query";

import http from "services/api/config/http";

interface Body {
  question: string;
}

const usePostQuestion = () => {
  const apiURL = process.env.NEXT_PUBLIC_API_URL;
  if (!apiURL) throw new Error("NEXT_PUBLIC_API_URL is not defined");

  return useMutation(async ({ question }: Body) =>
    http().post(apiURL, {
      question,
    })
  );
};

export default usePostQuestion;
