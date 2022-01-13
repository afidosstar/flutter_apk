FROM openjdk:8-jdk


ENV  DIRIECTORY_INSTALL      '/root/tools'
ENV  ANDROID_COMPILE_SDK    "28"
ENV  ANDROID_BUILD_TOOLS    "28.0.2"
ENV  ANDROID_SDK_TOOLS      "4333796"
ENV  FLUTTER_VERSION        "https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_2.8.1-stable.tar.xz"
ENV  ANDROID_HOME           "$DIRIECTORY_INSTALL/android-sdk-linux"
ENV  PATH                   "$PATH:$DIRIECTORY_INSTALL/android-sdk-linux/platform-tools/:$DIRIECTORY_INSTALL/flutter/bin"
ENV  FLUTTER_PATH           "$DIRIECTORY_INSTALL/flutter"




WORKDIR /root/tools

ADD entrypoint.sh .

ADD init.sh .

RUN chmod +x  entrypoint.sh init.sh

RUN bash init.sh

ENTRYPOINT ["/root/tools/entrypoint.sh"]



CMD ['flutter', 'doctor']


