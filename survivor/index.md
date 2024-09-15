
**Índice**
1. [Primer apartado](#id1)
2. [Segundo apartado](#id2)


<div id='id1' />
## Primer apartado

Texto del primer apartado
<div id='id2' />
## Segundo apartado

Texto del segundo apartado



**Índice**
1. [Primer apartado](#id1)
2. [Segundo apartado](#id2)
<div id='id1' />
## Primer apartado
Texto del primer apartado
<div id='id2' />
## Segundo apartado
Texto del segundo apartado


tomar de referencia para documentation

https://github.com/bancolombia/scaffold-clean-architecture/blob/master/README.md#generate-driven-adapter

  | Reference for **entryPointType** | Name                                   | Additional Options                       |Java   | Kotlin  |
   |----------------------------------|----------------------------------------|------------------------------------------|-------|---------|
   | generic                          | Empty Entry Point                      | --name [name]                            |&#9745;| &#9745; |
   | restmvc                          | API REST (Spring Boot Starter Web)     | --server [serverOption] default undertow |&#9745;| &#9745; |
   | webflux                          | API REST (Spring Boot Starter WebFlux) | --router [true, false] default true      |&#9745;| &#9745; |
   | rsocket                          | Rsocket Controller Entry Point         |                                          |&#9745;| &#9745; |
   | graphql                          | API GraphQL                            | --pathgql [name path] default /graphql   |&#9745;| &#9745; |
   | asynceventhandler                | Async Event Handler                    |                                          |&#9745;| &#9745; |
   | mq                               | JMS MQ Client to listen messages       |                                          |&#9745;| &#9745; |
   | sqs                              | SQS Listener                           |                                          |&#9745;| &#9745; |


