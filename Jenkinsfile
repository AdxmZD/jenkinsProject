@Library('jenkins_shared') _

pipeline{
    agent any

    options{
        timestamps()
    }

    environment{
        buildNumber = "${BUILD_NUMBER}"
        myEnvVar = "testenvvar"
    }

    parameters{
        string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'CHOICE', choices: ['One', 'Two', 'Three'], description: 'Pick something')

        password(name: 'PASSWORD', defaultValue: 'SECRET', description: 'Enter a password')
    }

    stages{
        stage("Build"){
            steps{
                echo "Build"
                helloVariable("Adam")
                echo "${buildNumber}"
                echo "${myEnvVar}"
                script{
                    utils.replaceString()
                    sh """
                        mkdir -p docker
                    """
                }
            }
        }
        stage("Docker Build"){
            agent{
                docker{
                    image "node:latest"
                    args "-v ${WORKSPACE}/docker:/home/node"
                }
            }
            steps{
                sh """
                node --version > /home/node/docker_node_version
                npm --version > /home/node/docker_npm_version
                """
            }
        }
        stage("Docker Python Build"){
            agent{
                docker{
                    image "python:latest"
                    args "-v ${WORKSPACE}/docker:/home/python"
                }
            }
            steps{
                sh """
                python --version > /home/python/docker_python_version
                """
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
        // cleanup{
        //     cleanWs()
        // }
    }
    
}