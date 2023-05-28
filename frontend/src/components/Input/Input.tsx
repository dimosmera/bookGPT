import { ActionTypes } from "context/StateProvider/reducer";
import { useUserState } from "context/StateProvider/StateProvider";

import styles from "./Input.module.css";

const Input = () => {
  const { state, dispatch } = useUserState();

  const handleInputChange = (event: React.FormEvent<HTMLTextAreaElement>) => {
    dispatch({
      type: ActionTypes.SET_QUESTION,
      question: event.currentTarget.value,
    });
  };

  const { question } = state;

  return (
    <textarea
      value={question}
      onChange={handleInputChange}
      className={styles.input}
    />
  );
};

export default Input;
