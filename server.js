const express = require('express')
const app = express()
const {createProxyMiddleware} = require('http-proxy-middleware')
const fs = require('fs')
// app.use(express.static(__dirname + '/'))

// 入口目录
app.get('/index', (req,res) => {
  fs.readFile('./home.html', (err, data) => {
    if(!err) {
      res.writeHead(200, { 'content-type': 'text/html' })
      res.write(data.toString())
    }
    res.end()
  })
})
app.use(
  '/api',
  createProxyMiddleware({ 
    target: 'https://lays.hedgead.com' ,
    changeOrigin: true,
    pathRewrite: {
      "^/api": ''
    }
  })
)

app.listen('7777', () => {
  console.log('启动成功')
})
