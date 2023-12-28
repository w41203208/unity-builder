pipeline {
  agent { node { label "Main" } }
  stages {
    stage('Build') {
      steps {
        sshPublisher(
          publishers: [
            sshPublisherDesc(
              configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', 
              transfers: [
                sshTransfer(
                  cleanRemote: false, 
                  excludes: '', 
                  execCommand: '''cd test/unity-builder
                    sudo rm -r temp
                    sudo rm -r build

                    sudo mkdir temp
                    sudo mkdir build

                    sudo rm -r test.log

                    sh docker-cmd.sh build>>test.log
                  ''', 
                  flatten: false, 
                  makeEmptyDirs: true, 
                  noDefaultExcludes: false, 
                  patternSeparator: '[, ]+', 
                  remoteDirectory: 'test/unity-builder ',
                  remoteDirectorySDF: false, 
                  removePrefix: '', 
                  sourceFiles: '**/*'
                )
              ], 
              usePromotionTimestamp: false, 
              useWorkspaceInPromotion: false, 
              verbose: true
            )
          ]
        )
      }
    }
    stage('Return-Active') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sh docker-cmd.sh exec return>>test.log
          
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
    stage('Post-Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 

          sudo docker ps | grep "custom-unity-editor" | awk '{print $1}' >containers.txt

          if [ -f $(pwd)/containers.txt ]; then
            while read -r container_id; do
              cc=$container_id
              cc_exit=$(sudo docker ps -a | grep "$cc");
              if [ "$cc_exit" != "" ]; then
                
                sh docker-cmd.sh stop>>test.log;
              fi;
            done < $(pwd)/containers.txt;
          fi
          
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 

          sh docker-cmd.sh run>>test.log
          
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
    stage('Get-Active') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          
          sh docker-cmd.sh exec active>>test.log
          
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: true)])
      }
    }
  }
}