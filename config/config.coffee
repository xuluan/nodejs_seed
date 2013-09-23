path = require 'path'
rootPath = path.normalize __dirname + '/..'
    
module.exports =
  development:
    env: 'development'
    db: 'mongodb://localhost/nodeseed-dev'
    root: rootPath
    app:
      name: 'Node Seed, development'
    port: 3000,
    secret: 'test',
    cookieSecret: 'test'
    google:
      clientID: "APP_ID",
      clientSecret: "APP_SECRET",
      callbackURL: "http://localhost:3000/auth/google/callback"

  test:
    env: 'test'
    db: 'mongodb://localhost/nodeseed-test'
    root: rootPath
    app:
      name: 'Node Seed, test'
    port: 4000,
    secret: 'test',
    cookieSecret: 'test'
    google:
      clientID: "APP_ID",
      clientSecret: "APP_SECRET",
      callbackURL: "http://localhost:3000/auth/google/callback"

  production:
    env: 'production'
    db: 'mongodb://localhost/nodeseed'
    root: rootPath
    app:
      name: 'Node Seed'
    port: 3000,
    secret: 'test',
    cookieSecret: 'test'
    google:
      clientID: "APP_ID",
      clientSecret: "APP_SECRET",
      callbackURL: "http://localhost:3000/auth/google/callback"