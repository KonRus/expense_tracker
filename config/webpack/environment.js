const { environment } = require('@rails/webpacker')
const babelLoader = environment.loaders.get('babel')
babelLoader.use.push({
  loader: 'babel-loader',
  options: {
    presets: ['@babel/preset-env'],
    plugins: [
      '@babel/plugin-proposal-optional-chaining',
      '@babel/plugin-proposal-nullish-coalescing-operator',
    ],
  },
})
module.exports = environment
