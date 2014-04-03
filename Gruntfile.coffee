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
      # features:
      #   expand: true
      #   cwd: 'features/cs/'
      #   src: ['**/*.coffee']
      #   dest: 'features/js/'
      #   ext: '.js'
    watch:
      scripts:
        files: ['app/cs/**/*.coffee','features/**/*.coffee']
        tasks: ['coffeelint','coffee']

  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-watch')