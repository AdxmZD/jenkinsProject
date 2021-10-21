pipeline{
    agent any

    options{
        timestamps()
    }

    stages{
        stage("Build"){
            steps{
                echo "Build"
            }
        }
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
            stage("Deploy"){
                steps{
                echo "Deploy"
                }
            }
        }
        
    }

    
}