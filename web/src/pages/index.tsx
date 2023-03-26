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
      <main className="h-[calc(100vh-7rem)] w-screen bg-gradient-to-b from-[#05010D] to-[#21014A] text-white">
        <div className="flex justify-around items-center pt-48">
          <div className="space-y-5">
            <h1 className="font-extrabold text-6xl">
              Short links, big impact.
            </h1>
            <p className="text-[#937F8B] text-xl">
              Snaplink the link shortener that simplifies your links, amplifies
              your message and builds trust with your audience.
            </p>
          </div>
          <div></div>
        </div>
      </main>
    </>
  );
}
