import type { NextConfig } from "next";
import withPWA from "next-pwa";

const withPWAConfig = withPWA({
  dest: "public",
  register: true,
  skipWaiting: true,
  disable: process.env.NODE_ENV === "development", // PWA desabilitado no modo dev
});

const nextConfig: NextConfig = {
  /* config options here */
};

//export default nextConfig;

export default withPWAConfig(nextConfig as Parameters<typeof withPWAConfig>[0]);