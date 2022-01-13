FROM openjdk:8-jdk


ENV  DURIECTORY_INSTALL      'usr/tools'
ENV  ANDROID_COMPILE_SDK    "28"
ENV  ANDROID_BUILD_TOOLS    "28.0.2"
ENV  ANDROID_SDK_TOOLS      "4333796"
ENV  FLUTTER_VERSION        "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.8.1-stable.tar.xz"
ENV  ANDROID_HOME           "$DURIECTORY_INSTALL/android-sdk-linux"
ENV  PATH                   "$PATH:$DURIECTORY_INSTALL/android-sdk-linux/platform-tools/:$DURIECTORY_INSTALL/flutter/bin"
ENV  FLUTTER_PATH           "$DURIECTORY_INSTALL/flutter"




WORKDIR /usr/tools

ADD entrypoint.sh .

ADD init.sh .

RUN chmod +x  entrypoint.sh init.sh

RUN bash init.sh

ENTRYPOINT ["/usr/tools/entrypoint.sh"]



CMD ['flutter', 'doctor']


