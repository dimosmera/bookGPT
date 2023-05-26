import Image from "next/image";

import AppHead from "components/AppHead";
import Input from "components/Input/Input";

import styles from "./Home.module.css";

const Home = () => {
  return (
    <>
      <AppHead />

      <main className={styles.main}>
        <div className={styles.center}>
          <Image
            className={styles.coverImg}
            src="/IHaveNoMouth.jpg"
            alt="Book cover image"
            width={136}
            height={200}
            priority
          />

          <h1 className={styles.header}>Ask A Book</h1>

          <p className={styles.descriptionText}>
            {
              'The AI is trained on a short story by Harlan Ellison, "I Have No Mouth, and I Must Scream". Ask a question about this story and it will answer it in real-time:'
            }
          </p>

          <Input />
        </div>

        <div className={styles.footer}>
          <p>By</p>
          <a
            href="https://twitter.com/dimos851"
            target="_blank"
            rel="noopener noreferrer"
          >
            <p className={styles.footerLinkText}>dimos851</p>
          </a>

          <p>•</p>

          <a
            href="https://github.com/dimosmera/bookGPT/"
            target="_blank"
            rel="noopener noreferrer"
          >
            <p className={styles.footerLinkText}>Fork on GitHub</p>
          </a>
        </div>
      </main>
    </>
  );
};

export default Home;
