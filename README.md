# dagger-gradle

Thanks to dagger, you do not need to install JDK any more to build java project.

## Prerequisite

You need to install dagger:

    https://docs.dagger.io/1200/local-dev
    
You also need to install docker.

    https://docs.docker.com/engine/install/
    
## Build

    $ git clone https://github.com/ruimo/dagger-gradle.git
    $ dagger project init
    $ dagger project update
    $ dagger do build -l debug --log-format plain
