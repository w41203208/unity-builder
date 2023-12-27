pipeline {
  agent { node { label "Main" } }
  stages {
    stage('Build') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sudo rm -r test.log
          sh docker-cmd.sh build>>test.log
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '**/*')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
    stage('Deploy') {
      steps {
        sshPublisher(publishers: [sshPublisherDesc(configName: '104.199.220.141-hq-d-ubuntu-for-srs-and-webrtc-template-2-SSH', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: '''cd test/unity-builder 
          sudo rm -r temp
          sudo rm -r build

          sudo mkdir temp
          sudo mkdir build

          if [ -e containers.txt ]; then
            while read -r container_id; do
              container_exit=$(sudo docker ps -a | grep "$container_id");
              if [ "$container_exit" != "" ]; then
                sh docker-cmd.sh exec return>>test.log;
                sh docker-cmd.sh stop>>test.log;
              fi;
            done <containers.txt;
          fi
          
          
          sh docker-cmd.sh run>>test.log

          sh docker-cmd.sh exec active>>test.log

          
          ''', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}

//           sh docker-cmd.sh run>>test.log

//           sh docker-cmd.sh exec active>>test.log