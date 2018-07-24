node('master') {

    def Repository = "kunal2791/rabbitMQ"
    def Job = "rabbitMQ"
    def ScriptPath = "."
    def FILE = "main.yaml"


    properties([buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '', daysToKeepStr: '30', numToKeepStr: '15')),
                disableConcurrentBuilds(),
                gitLabConnection('https://github.com/kunal2791/rabbitMQ.git'), [$class: 'GitlabLogoProperty', repositoryName: '${RepositoryName}'], pipelineTriggers([])])

    stage("Checkout") {

        checkout scm
    }
    stage("Check Ansible installation") {
        dir("${ScriptPath}") {

            sh 'ssh ec2-user@jump "ansible --version"'
            sh 'ssh ec2-user@jump "cat /etc/ansible/hosts"'
            //	 sh 'ssh ec2-user@demojump "mkdir ansible"'
            sh 'scp -r *.yaml ec2-user@jump:/home/ec2-user/'
        }
    }

    stage("Check Ansible installation Script") {
        dir("${ScriptPath}") {

            sh 'ssh ec2-user@jump "ansible-playbook main.yaml -s -v"'
        }
    }

    // stage("Installation") {
    //               dir("${ScriptPath}"){
    //	sh 'ssh ec2-user@demojump "ansible-playbook main.yaml -s -v"'
    //             }
    //}

    stage("Wipe Out DIR") {

        deleteDir()
    }

    stage("Post Action") {

        notifyBuild(currentBuild.result)
    }
}

def notifyBuild(String buildStatus = 'STARTED') {
    // build status of null means successful
    buildStatus = buildStatus ?: 'SUCCESSFUL'

    // Default values
    def config = [:]
    def colorName = 'RED'
    def colorCode = '#FF0000'
    def subject = "${buildStatus}: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'"
    def summary = "${subject} (${env.BUILD_URL})"
    def details = """<p>STARTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]':</p>
     <p>Check console output at "<a href="${env.BUILD_URL}">${env.JOB_NAME} [${env.BUILD_NUMBER}]</a>"</p>"""
    def attachLog = (config.attachLog != null) ? config.attachLog : (currentBuild.result != "SUCCESS")

    // Override default values based on build status
    if (buildStatus == 'STARTED') {
        color = 'YELLOW'
        colorCode = '#FFFF00'
    } else if (buildStatus == 'SUCCESSFUL') {
        color = 'GREEN'
        colorCode = '#00FF00'
    } else {
        color = 'RED'
        colorCode = '#FF0000'
    }
    // Send notifications
    emailext(
            subject: subject,
            body: details,
            recipientProviders: [[$class: 'RequesterRecipientProvider']],
            attachLog: attachLog
    )
}
