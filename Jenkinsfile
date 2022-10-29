pipeline{
    agent any
    stages{
        stage("Code Checkout"){
            steps{
                 bat "echo Hell0"
            }
            
        }
        stage("Code Build"){
               steps{
             bat "echo Build"
               }
        }
        stage("Unit Test"){
            steps{
             bat "echo UnitTest"
            }
        }
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
