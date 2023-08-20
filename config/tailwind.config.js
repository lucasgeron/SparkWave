const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/flowbite/**/*.js'
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
      spacing: {
        '18': '4.5rem',
        '30': '7.5rem',
        '42': '10.5rem',
        '54': '13.5rem',
        '86': '21.5rem',
      },
      animation: {
        wiggle: 'wiggle 1s ease-in-out infinite',
        breathe: 'breathe 3s ease-in-out infinite',
        notify: 'notify 3s ease-in-out infinite',
      },
      keyframes: {
        wiggle: {
          '0%, 100%': { transform: 'rotate(-3deg)' },
          '50%': { transform: 'rotate(3deg)' },
        },
        breathe: {
          '0%, 100%': { transform: 'scale(1.0)' },
          '50%': { transform: 'scale(1.02)' },
        },
        notify: {
          '0%, 33.33%': { transform: 'scale(0.8)', opacity: 0 },
          '33.33%, 66.66%': { transform: 'scale(1)', opacity: 1 },
          '66.66%, 100%': { transform: 'scale(0.8)', opacity: 0 },
        }
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('flowbite/plugin'),
  ]
}
