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
             bat "mvn clean install"
               }
        }
        stage("Unit Test"){
            steps{
             bat "mvn test"
            }
        }
         stage("Build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('SonarQube') {
                bat "mvn --version"
                bat "mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar"
                //bat 'mvn clean package sonar:sonar'
              }
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
        stage("Build Image"){
            steps {
                bat "docker build -t myfirstContainer:${BUILD_NUMBER} ."
            }
        }
        stage("Docker Deployment"){
            steps {
             bat "docker run --name myfirstContainer -d -p 9050:8080 myfirstContainer:${BUILD_NUMBER}"
            }
        }
        
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
