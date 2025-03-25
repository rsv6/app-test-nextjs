'use client';
import { useEffect, useState } from 'react';

export default function RootLayout({
  children,
}: {
  children: React.ReactNode;
}) {
  const [isClient, setIsClient] = useState(false);

  useEffect(() => {
    setIsClient(true);
  }, []);

  return (
    <html lang="pt-BR">
      <head>
        <link rel="manifest" href="/manifest.json" />
        <link rel="icon" href="/globe.svg" />
        <meta name="theme-color" content="#ffffff" />
      </head>
      <body>
        {isClient ? children : <p>Carregando...</p>}
      </body>
    </html>
  );
}
