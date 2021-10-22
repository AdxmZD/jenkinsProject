@Library('jenkins_shared') _

pipeline{
    agent any

    options{
        timestamps()
    }

    stages{
        stage("Build"){
            steps{
                echo "Build"
                helloVariable("Adam")
                script{
                    utils.replaceString()
                }
            }
        }
        stage("Test"){
            parallel{
                stage("Test on Windows"){
                    steps{
                        echo "Windows Test"
                        sh "./test.sh ${BUILD_NUMBER}"
                    }
                }
                stage("Test on Linux"){
                    steps{
                        echo "Linux Test"
                    }
                }
            }
        }    
        stage("Start first job"){
            steps{
                sshPublisher(publishers: [sshPublisherDesc(configName: 'Http', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'mv index.html /var/www/html', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: 'index.html')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
            }
        }
        stage("Deploy"){
            steps{
                echo "Deploy"
            }
        }
    }
    post{
        always{
            archiveArtifacts artifacts: 'index.html', followSymlinks: false
        }
    }
    
}