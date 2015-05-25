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

  #Load Tasks
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.registerTask 'compile', ['coffee']
