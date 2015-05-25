module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      coffee_to_js:
        expand: true
        flatten: false
        cwd: "src/js"
        src: ["**/*.coffee"]
        dest: 'build/js'
        ext: ".js"
    haml:
      dist:
        files:
          'build/index.html': 'src/index.haml'

    copy:
      main:
        expand: true
        cwd: 'src'
        src: ['res/*', 'css/*']
        dest: 'build'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.registerTask 'compile', ['coffee', 'haml', 'copy']
