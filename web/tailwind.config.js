/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./src/**/*.{js,ts,jsx,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: {
          DEFAULT: '#485AFB',
          100: '#6C86AD',
          400: '#5599FF',
          500: '#485AFB',
          600: '#3250CA',
          700: '#182C4C',
          800: '#0D1C33',
          900: '#1B101E',
        },
      },
    },
  },
  plugins: [],
};
