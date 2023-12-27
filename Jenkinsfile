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

          if [ -f containers.txt ]; then
            echo get file>>test.log;
            while read -r container_id; do
              echo get container id: $container_id>>test.log;
              container_exit=$(sudo docker ps -a | grep "$container_id");
              echo $container_exit>>test.log;
              if [ "$container_exit" != "" ]; then
                echo stop>>test.log;
              fi;
            done <containers.txt;
          fi
          
          sh docker-cmd.sh run>>test.log
          
          
          ''', flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: 'test/unity-builder ', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
      }
    }
  }
}
//sh docker-cmd.sh stop>>test.log;
// sh docker-cmd.sh exec return>>test.log;

// sh docker-cmd.sh run>>test.log

          // sh docker-cmd.sh exec active>>test.log
