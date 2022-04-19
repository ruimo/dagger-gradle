package main

import (
    "dagger.io/dagger"
    "universe.dagger.io/docker"
)

#GradleBuild: {
    src: dagger.#FS

    // Build steps
    _build: docker.#Build & {
        steps: [
            docker.#Pull & {
                source: "library/openjdk:11"
            },
            docker.#Copy & {
                contents: src
                dest:     "/src"
            },
            docker.#Run & {
                command: {
                    name: "./gradlew"
                    args: ["run"]
                },
                workdir: "/src",
                always: true,
            },
        ]
    }
}

// Example usage in a plan
dagger.#Plan & {
    client: filesystem: ".": read: contents: dagger.#FS

    actions: build: #GradleBuild & {
        src: client.filesystem.".".read.contents
    }
}