import styles from "./Input.module.css";

const Input = () => {
  return (
    <textarea
      value="What is the I Have No Mouth, and I Must Scream about?"
      // onChange={}
      className={styles.input}
    />
  );
};

export default Input;
