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
         stage("build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('SonarQube') {
                bat 'mvn clean package sonar:sonar'
              }
            }
         stage("Artifact deployer") {
            steps {
                rtMavenDeployer (
                    id: 'deployer-unique-id',
                    serverId: 'jagjeet@artifactory',
                    releaseRepo: 'NagpPractice',
                    snapshotRepo: 'NagpPractice'
                )
                rtMavenRun (
                pom: 'pom.xml',
                goals: 'clean install',
                deployerId: 'deployer-unique-id'
                )
                rtPublishBuildInfo(
                    serverId: 'jagjeet@artifactory'
                )
             }
         }
       }
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
