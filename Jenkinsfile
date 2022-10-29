pipeline{
    agent any
    tools{
    maven "Maven"
    }
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
             bat "mvn clean"
            }
        }
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
