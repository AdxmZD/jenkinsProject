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
                        sh "./test.sh"
                    }
                }
                stage("Test on Linux"){
                    steps{
                        echo "Linux Test"
                    }
                }
        
                // stage("Test replaceString"){
                //     steps{
                //         sh """
                //             cat index.html | grep 'Deployed by Jenkins job: ${BUILD_NUMBER}'
                //         """
                //     }
                // }
            }
        }    
        stage("Deploy"){
            steps{
                echo "Deploy"
            }
        }
    }

    
}