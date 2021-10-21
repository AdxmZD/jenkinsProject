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
                if ("index.html".count("%BUILD_NUMBER%") == 0) {
                    echo "Successfully replaced string"
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