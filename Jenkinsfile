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
             bat "mvn clean install"
            }
        }
         stage("Build & SonarQube analysis") {
            agent any
            steps {
              withSonarQubeEnv('SonarQube') {
                bat "mvn --version"
                bat "mvn clean package org.sonarsource.scanner.maven:sonar-maven-plugin:4.7.0.2747:sonar"
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
    }
        post{
            success{
            bat "echo Success"
            }
        }
}
