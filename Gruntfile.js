// Project configuration.
module.exports = function(grunt) {
grunt.loadNpmTasks('grunt-contrib-connect');
grunt.initConfig({
  connect: {
    server: {
      options: {
        port: 9000,
        hostname: '0.0.0.0',
        base: 'app',
        keepalive: true
      }
    }
  }
})

};