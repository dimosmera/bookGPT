import type { AppProps } from "next/app";
import { Inter } from "next/font/google";

import "styles/globals.css";

import AppQueryClientProvider from "context/AppQueryClientProvider";

const inter = Inter({ subsets: ["latin"] });

export default function App({ Component, pageProps }: AppProps) {
  return (
    <AppQueryClientProvider>
      <main className={inter.className}>
        <Component {...pageProps} />
      </main>
    </AppQueryClientProvider>
  );
}
