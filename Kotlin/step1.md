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
mkdir src/main/kotlin/com.example.demo/
vi src/main/kotlin/com.example.demo/Controller.kt
```{{exec}}

* Controller.kt
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

* 作成したユーザでログイン
[ACCESS TO Hello World]({{TRAFFIC_HOST1_8080}})
