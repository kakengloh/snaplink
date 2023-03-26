import Head from 'next/head';
import Header from '@/components/Header';

export default function Home() {
  return (
    <>
      <Head>
        <title>Snaplink</title>
        <meta
          name="description"
          content="Snaplink is a powerful and easy-to-use link shortener that allows you to quickly and easily shorten long URLs into shorter, more manageable links. It is the perfect tool for anyone looking to share links online. Try Snaplink today and start sharing smarter!"
        />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="icon" href="/favicon.ico" />
      </Head>
      <Header />
      <main className="h-screen w-screen bg-gradient-to-b from-[#05010D] to-[#21014A]"></main>
    </>
  );
}
