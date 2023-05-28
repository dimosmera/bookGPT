import { useState, useEffect } from "react";

const useCountdown = (startFrom: number) => {
  const [count, setCount] = useState(startFrom);

  useEffect(() => {
    const interval = setInterval(() => {
      setCount(count - 1);
    }, 1000);

    // Clear interval on unmount
    return () => clearInterval(interval);
  }, [count]);

  return count;
};

export default useCountdown;
