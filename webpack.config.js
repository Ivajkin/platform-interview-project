var path = require('path');
var webpack = require('webpack');
// var ExtractTextPlugin = require("extract-text-webpack-plugin");

// var extractSass = new ExtractTextPlugin({
//     filename: "styles.css",
//     allChunks: true,
//     disable: false
// });

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
        test: /\.(js|jsx)$/,
        loader: 'babel-loader',
        include: path.join(__dirname, 'app'),
        query: {
          presets: ['es2015']
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
};
