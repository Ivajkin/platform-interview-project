var path = require('path');
var webpack = require('webpack');

module.exports = {
  devtool: 'source-map',
  entry: [
    './app/app.js',
  ],
  output: {
    path: path.join(__dirname, 'dist'),
    filename: 'bundle.js',
    publicPath: '/'
  },
  module: {
    rules: [
      // js
      {
        test: /\.js$/,
        loader: 'babel-loader',
        include: path.join(__dirname, 'app'),
        query: {
          presets: ['es2015'],
          plugins: ['transform-object-rest-spread']
        }
      },
      // CSS
      { 
        test: /\.scss$/, 
        include: path.join(__dirname,'app'),
        use: [
          { loader: "style-loader" },
          { loader: "css-loader" },
          { loader: "sass-loader" }
        ]
      }
    ]
  },
  resolve: {
    modules: ['node_modules'],
    extensions: ['.js','.scss'],
  },

  plugins: [
    new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
        "window.jQuery": "jquery"
    })
]
};
