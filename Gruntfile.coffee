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
    coffee:
      compile:
        expand: true
        cwd: 'app/cs/'
        src: ['**/*.coffee']
        dest: 'app/js/'
        ext: '.js'
    watch:
      scripts:
        files: ['app/cs/**/*.coffee']
        tasks: ['coffeelint','coffee']

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')