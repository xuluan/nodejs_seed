
coffeelint_files = ["./*.coffee",
        "./assets/**/*.coffee",
        "./app/**/*.coffee",
        "./config/**/*.coffee",
        "./test/**/*.coffee"]
        
module.exports = (grunt) ->
  require("load-grunt-tasks") grunt
    
  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    watch:
      coffeelint:
        files: coffeelint_files
        
        tasks: ['coffeelint:app']
        options:
          spawn: true
        
    coffeelint:
      options:
        no_trailing_whitespace:
          level: "warn"

        max_line_length:
          level: "error"
          value: "100"

      app:coffeelint_files

    nodemon:
      dev:
        options:
          file: "server.coffee"
          ignoredFiles: ["README.md", "node_modules/**", "test/**"],
          watchedExtensions: ["js", "coffee", "css", "ejs", "json", "html"]
          watchedFolders: ["."]
          delayTime: 0
          legacyWatch: true
          env:
            PORT: "3000"

          cwd: __dirname

    karma:
      unit:
        configFile: "config/karma.conf.coffee"
        singleRun: true
      e2e:
        configFile: "config/karma-e2e.conf.coffee"
        singleRun: true
        
    concurrent:
      options:
        logConcurrentOutput: true
      server: ["watch:coffeelint", "nodemon:dev"]
  
  grunt.registerTask 'server', ['concurrent:server']
  grunt.registerTask 'test', ['karma:unit']
  