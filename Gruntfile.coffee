module.exports = (grunt)->
  grunt.initConfig
    connect:
      server:
        options:
          keepalive: true
          port: 9001
          base: 'app'
    coffeelint:
      app: ['app/cs/**/*.coffee']
      features: ['features/**/*.coffee']
    coffee:
      app:
        expand: true
        cwd: 'app/cs/'
        src: ['**/*.coffee']
        dest: 'app/js/'
        ext: '.js'
    exec:
      wd:
        cmd: ''
    cucumberjs:
      src: ['features/**/*.feature']
      options:
        format: 'summary'

    selenium_start: {}
    selenium_stop: {}

    watch:
      scripts:
        files: ['app/cs/**/*.coffee','features/**/*.coffee']
        tasks: ['coffeelint','coffee']

  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-cucumber'
  grunt.loadNpmTasks 'grunt-selenium-webdriver'

  grunt.registerTask 'test-features', 'Start selenium and run cucumberjs tests', ()->
    grunt.log.writeln 'current:',grunt.task.current
    grunt.task.run ['selenium_start','cucumberjs']
    if grunt.fail
      grunt.task.run ['selenium_stop']
      grunt.log.writeln 'some failure'
    else
      grunt.log.writeln 'everything ok'
      grunt.task.run ['selenium_stop']
