import Head from 'next/head';
import Header from '@/components/Header';
import { BsMagic } from 'react-icons/bs';
import { FiCopy } from 'react-icons/fi';
import { MdRefresh } from 'react-icons/md';
import Button from '@/components/Button';
import FormInput from '@/components/FormInput';
import api from '@/services/api';
import { useMutation } from 'react-query';
import { SubmitErrorHandler, SubmitHandler, useForm } from 'react-hook-form';
import { isValidUrl } from '@/utils/common';
import { useState } from 'react';
import { Link } from '@/types/link';

interface ShortenLinkForm {
  targetUrl: string;
}

export default function Home() {
  const {
    register,
    handleSubmit,
    formState: { errors },
    reset,
  } = useForm<ShortenLinkForm>({
    defaultValues: { targetUrl: '' },
    mode: 'all',
  });

  const { mutateAsync: createLink, isLoading } = useMutation(
    (targetUrl: string) => api.createLink(targetUrl)
  );

  const [link, setLink] = useState<Link>();

  const resetForm = () => {
    reset();
    setLink(undefined);
  };

  const copyShortUrl = async () => {
    if (link) {
      await navigator.clipboard.writeText(link.short_url);
    }
  };

  const onFormSubmit: SubmitHandler<ShortenLinkForm> = async ({
    targetUrl,
  }) => {
    try {
      const link = await createLink(targetUrl);
      setLink(link);
    } catch (err) {
      console.error('Create link error:', err);
    }
  };

  const onFormError: SubmitErrorHandler<ShortenLinkForm> = (errors) => {
    console.error('Form submit error:', errors);
  };

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
          <form
            className="w-[600px] space-y-5 bg-gray-900 p-5 rounded-xl"
            onSubmit={handleSubmit(onFormSubmit, onFormError)}
          >
            <FormInput
              name="targetUrl"
              register={register}
              rules={{
                required: 'URL is required',
                validate: (value) =>
                  isValidUrl(value) ? true : 'Please enter a valid URL',
              }}
              placeholder="Enter long URL"
              error={errors.targetUrl?.message}
            />

            {link ? (
              <div className="flex items-center space-x-2">
                <Button
                  isFullWidth
                  text={link.short_url}
                  icon={FiCopy}
                  onClick={copyShortUrl}
                />
                <button onClick={resetForm}>
                  <MdRefresh className="h-6 w-6 text-primary-400 hover:opacity-80" />
                </button>
              </div>
            ) : (
              <Button
                type="submit"
                isFullWidth
                isLoading={isLoading}
                icon={BsMagic}
                text="Shorten"
              />
            )}
          </form>
        </div>
      </main>
    </>
  );
}
