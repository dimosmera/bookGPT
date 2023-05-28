import usePostQuestion from "services/api/usePostQuestion";
import { ActionTypes } from "context/StateProvider/reducer";
import { useUserState } from "context/StateProvider/StateProvider";

import styles from "./AskButton.module.css";

const AskButton = () => {
  const { mutateAsync: postQuestion } = usePostQuestion();
  const { state, dispatch } = useUserState();

  const { question, answer } = state;

  const handlePostQuestion = async () => {
    try {
      const result = await postQuestion({
        question,
      });

      const { answer } = result.data;

      dispatch({
        type: ActionTypes.SET_ANSWER,
        answer,
      });
    } catch (error) {
      console.error(error);
    }
  };

  return (
    <button className={styles.button} onClick={handlePostQuestion}>
      {answer ? "Ask another question" : "Ask question"}
    </button>
  );
};

export default AskButton;
