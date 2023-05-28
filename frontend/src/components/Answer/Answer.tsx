import { useUserState } from "context/StateProvider/StateProvider";

import styles from "./Answer.module.css";

const Answer = () => {
  const { state } = useUserState();

  const { answer } = state;

  if (!answer) return null;

  return (
    <div className={styles.container}>
      <p>
        <strong>Answer: </strong>
        {answer}
      </p>
    </div>
  );
};

export default Answer;
