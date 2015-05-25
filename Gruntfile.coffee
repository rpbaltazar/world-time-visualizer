module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      coffee_to_js:
        expand: true
        flatten: false
        cwd: "src"
        src: ["**/*.coffee"]
        dest: 'lib/js'
        ext: ".js"
    haml:
      dist:
        files:
          'index.html': 'index.haml'

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-haml2html'
  grunt.registerTask 'compile', ['coffee', 'haml']
