module.exports = (grunt) ->

    grunt.loadNpmTasks 'grunt-mocha-test'
    grunt.loadNpmTasks 'grunt-contrib-watch'

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


    grunt.registerTask 'test', 'mochaTest'
