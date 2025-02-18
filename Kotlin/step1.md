# LangChain Start

## 
## springboot initializer download
```
curl -s https://start.spring.io/starter.zip \
-d type=gradle-project-kotlin \
-d language=kotlin \
-d bootVersion=3.4.2 \
-d dependencies=web \
-d javaVersion=17 \
-o demo.zip
```{{exec}}

## Unurchive zip file
```
unzip demo.zip -d demo
cd demo
```{{exec}}

## Hello World!
```
vi src/main/kotlin/com/example/demo/Helloworld.kt
```{{exec}}

* Helloworld.kt
```
package com.example.demo

import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class HelloController {

    @GetMapping("/")
    fun hello(): String {
        return "Hello, World!"
    }
}
```{{copy}}

## Boot
```
./gradlew bootRun
```

* Hello Worldを表示
[ACCESS TO Hello World]({{TRAFFIC_HOST1_8080}})

## Docker化
```
vi Dockerfile
```{{exec}}

```
# ベースイメージ
FROM openjdk:17-jdk-slim

# アプリケーションを格納するディレクトリ
WORKDIR /app

# Gradle Wrapper をコピー
COPY gradlew gradlew
COPY gradle ./gradle

# Gradle キャッシュをコンテナにコピー
# 拡張子を .kts に変更
COPY build.gradle.kts settings.gradle.kts ./
COPY src src
RUN ./gradlew bootJar --no-daemon

# アプリケーションのjarファイルをコピー
RUN cp build/libs/*.jar /app/app.jar

# ポート番号を公開
EXPOSE 8080

# アプリケーションを実行
CMD ["java", "-jar", "/app/app.jar"]
```{{copy}}

* docker build
```
docker build --no-cache -t kotlin-app .
```{{exec}}

* 起動
```
docker run --rm --name kotlin -p 8080:8080 kotlin-app
```

* Hello Worldを表示
[ACCESS TO Hello World]({{TRAFFIC_HOST1_8080}})
