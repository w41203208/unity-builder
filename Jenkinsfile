pipeline {
  agent { node { label "Main" } }
  stages {
    stage('Build') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sudo bash docker-cmd.sh build>>test.log
          ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sudo bash docker-cmd.sh run>>test.log
          ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
    stage('Get-Activation') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sudo bash docker-cmd.sh exec active>>test.log
          ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}