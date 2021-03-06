# Karma configuration
# http://karma-runner.github.io/0.10/config/configuration-file.html
module.exports = (config) ->
  config.set
    
    # base path, that will be used to resolve files and exclude
    basePath: ".."
    
    # testing framework to use (jasmine/mocha/qunit/...)
    frameworks: ["jasmine"]
    
    # list of files / patterns to load in the browser
    files: ["assets/js/lib/angular-1.0.8/angular.min.js",
    "assets/js/lib/angular-1.0.8/angular-resource.min.js",
    "assets/js/lib/angular-1.0.8/angular-mocks.js",
    "assets/js/app.coffee",
    "assets/js/services/articles_service.coffee",
    "assets/js/controllers/articles_controller.coffee",
    "test/mock/**/*.coffee",
    "test/spec/**/*.coffee"]
    
    # list of files / patterns to exclude
    exclude: []
    
    # web server port
    port: 8080
    
    # level of logging
    # possible values: LOG_DISABLE || LOG_ERROR || LOG_WARN || LOG_INFO || LOG_DEBUG
    logLevel: config.LOG_INFO
    
    # enable / disable watching file and executing tests whenever any file changes
    autoWatch: true
    
    # Start these browsers, currently available:
    # - Chrome
    # - ChromeCanary
    # - Firefox
    # - Opera
    # - Safari (only Mac)
    # - PhantomJS
    # - IE (only Windows)
    browsers: ["Chrome"]
    
    # Continuous Integration mode
    # if true, it capture browsers, run tests and exit
    singleRun: false

