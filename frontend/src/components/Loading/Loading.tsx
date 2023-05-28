import useCountdown from "./useCountdown";
import styles from "./Loading.module.css";

const Loading = () => {
  const count = useCountdown(30);

  return (
    <div className={styles.container}>
      Hold on... this might take up to {count} seconds
    </div>
  );
};

export default Loading;
