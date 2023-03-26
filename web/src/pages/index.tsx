import Head from 'next/head';
import Header from '@/components/Header';
import { useState } from 'react';
import { BsMagic } from 'react-icons/bs';
import Button from '@/components/Button';
import Input from '@/components/Input';

export default function Home() {
  const [targetUrl, setTargetUrl] = useState('');

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
      <main className="h-[calc(100vh-7rem)] w-screen bg-gradient-to-r from-primary-800 to-primary-900 text-white px-5 md:px-96">
        <div className="flex flex-wrap md:flex-nowrap justify-between items-center md:pt-48 gap-y-5">
          <div className="space-y-5 text-center md:text-start">
            <h1 className="font-extrabold text-6xl leading-tight text-transparent bg-clip-text bg-gradient-to-r from-primary to-primary-600">
              Short links, <br />
              big impact.
            </h1>
            <p className="text-primary-100 text-xl w-full md:w-2/3">
              Snaplink simplifies your links, amplifies your message and builds
              trust with your audience.
            </p>
          </div>
          <div className="w-[600px] space-y-5 bg-gray-900 p-5 rounded-xl">
            <Input
              value={targetUrl}
              onChange={(value) => setTargetUrl(value)}
              placeholder="Enter long URL"
            />
            <Button isFullWidth icon={BsMagic} text="Shorten" />
          </div>
        </div>
      </main>
    </>
  );
}
