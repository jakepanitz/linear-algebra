module.exports = (grunt) ->

    grunt.loadNpmTasks 'grunt-mocha-test'
    grunt.loadNpmTasks 'grunt-contrib-watch'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-uglify'

    grunt.initConfig
        mochaTest:
            test:
                options:
                    reporter: 'spec'
                    require: 'coffee-script/register'
                    quiet: false
                    clearRequireCache: false
                src: ['test/**/*.coffee']
        watch:
            scripts:
                files: ['src/**/*.coffee', 'test/**/*.coffee']
                tasks: ['test']
                options:
                    spawn: true
        coffee:
            compileJoined:
                options:
                    join: true
                files:
                    'lib/linear.js': 'src/**/*.coffee'
        uglify:
            my_target:
                files: 'lib/linear.min.js' : 'lib/linear.js'


    grunt.registerTask 'test', 'mochaTest'
    grunt.registerTask 'build', ['coffee', 'uglify']
