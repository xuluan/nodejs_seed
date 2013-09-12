module.exports = (grunt) ->
  
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    watch:
      app:
        files: ["./*.coffee", "./assets/**/*.coffee", "./app/**/*.coffee", "./config/**/*.coffee"]
        tasks: ['coffeelint:app']
        options:
          spawn: false

    
    coffeelint:
      options:
        no_trailing_whitespace:
          level: "warn"

        max_line_length:
          level: "error"
          value: "100"

      app: ["./*.coffee", "./assets/**/*.coffee", "./app/**/*.coffee", "./config/**/*.coffee"]

    nodemon:
      dev:
        options:
          file: "server.coffee"
          ignoredFiles: ["README.md", "node_modules/**"]
          watchedExtensions: ["js", "coffee", "css", "ejs", "json"]
          watchedFolders: ["."]
          delayTime: 1
          legacyWatch: true
          env:
            PORT: "3000"

          cwd: __dirname

  grunt.loadNpmTasks "grunt-nodemon"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks 'grunt-contrib-watch'
  
  grunt.registerTask 'default', ['coffeelint:app', 'nodemon:dev']
  