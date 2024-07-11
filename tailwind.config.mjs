/** @type {import('tailwindcss').Config} */
export default {
  content: ['./src/**/*.{astro,html,js,jsx,md,mdx,svelte,ts,tsx,vue}'],
  theme: {
    extend: {
      colors: {
        durazno: {
          light: '#FFB899',
          DEFAULT: '#FF7F50',
          dark: '#FF6347',
        },
        pera: {
          light: '#C8E6C9',
          DEFAULT: '#8BC34A',
          dark: '#388E3C',
        },
        manzana: {
          light: '#FFCDD2',
          DEFAULT: '#F44336',
          dark: '#D32F2F',
        },
      },
    },
    plugins: [],
  },
};
