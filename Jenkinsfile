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
                    releaseRepo: 'devopsNagp',
                    snapshotRepo: 'devopsNagp'
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
                bat "docker build -t myfirstimage:${BUILD_NUMBER} ."
            }
        }
        stage("Docker Deployment"){
            steps {
             bat "docker run --name myfirstcontainer -d -p 9050:8080 myfirstimage:${BUILD_NUMBER}"
            }
        }
        
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
