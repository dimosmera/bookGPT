import HomePage from "pages-lib/Home";
import StateProvider from "context/StateProvider";

export default function Home() {
  return (
    <StateProvider>
      <HomePage />
    </StateProvider>
  );
}
