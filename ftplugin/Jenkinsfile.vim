if exists("b:did_ftplugin") | finish | endif
let b:did_ftplugin = 1

autocmd BufWritePost Jenkinsfile !jenkins_file_linter %
