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
                printFromFunction()
                replaceString()
                helloVariable("Adam")
                script{
                    utils.printFromFunction()
                }
            }
        }
        stage("Test"){
            parallel{
                stage("Test on Windows"){
                    steps{
                        echo "Windows Test"
                    }
                }
                stage("Test on Linux"){
                    steps{
                        echo "Linux Test"
                    }
                }
            }
        }    
        stage("Deploy"){
            steps{
                echo "Deploy"
            }
        }
    }

    
}