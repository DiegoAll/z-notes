

# Markdown guide

Markdown seria como una forma simplificada de HTML.


https://editormarkdown.com/
markdown editor

- Formatos básicos, salto de línea y párrafos

Para escribir en cursiva colocaremos un asterisco o guión bajo delante y detrás del texto; para negrita serán dos y para negrita y cursiva, tres:

e: *Cursiva*
r: Cursiva

e: **Negrita**
r: Negrita

e: ***Cursiva y negrita***
r: Cursiva y negrita


DOcumentacion oficial  

https://daringfireball.net/projects/markdown/syntax 

tables 
https://experienceleague.adobe.com/docs/contributor/contributor-guide/writing-essentials/markdown.html?lang=es


 
- Enlaces externos


Para escribir enlaces en nuestros textos seguiremos la sintaxis usada en los siguientes ejemplos:

e: <http://www.correos.es>
r: http://www.correos.es

e: [Markdown](http://es.wikipedia.org/wiki/Markdown "Wikipedia")
r: Markdown

e: <nombre@gmail.com>
r: nombre@gmail.com
 
e: [Antonio](mailto:nombre@gmail.com)
r: Antonio




- Enlaces de referencia

En cualquier lugar de un texto podemos crear una lista de enlaces que pueden estar numerados o identificados por una etiqueta. Esa lista no será visible si convertimos el documento a .HTML pero se usará como índice para hacer referencia a los enlaces en cualquier lugar del documento.


e: Numerados. [Ubuntu][1] y [Firefox][2]
r: Ubuntu y Firefox

e: Etiquetas. Me gusta [Guadalinex][]
r: Me gusta Guadalinex

lista:
[1]: http://www.ubuntu.com "Ubuntu"
[2]: http://www.mozilla.org "Mozilla Firefox"
[Guadalinex]: http://www.guadalinex.org


hay mucho mas revisar en :

referencia https://python-para-impacientes.blogspot.com/2014/09/markdown-para-python-i.html



- Tablas

https://www.tablesgenerator.com/markdown_tables

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

# Insertar imagenes

<img src="/assets/factory.png" align="right" width="300px" height="300px" vspace="20" />







# Lista de tareas (ideas)

buena referencia https://www.w3schools.io/file/markdown-introduction/

https://github.blog/2014-04-28-task-lists-in-all-markdown-documents/ 



https://github.com/FND/markdown-checklist/blob/master/README




https://www.w3schools.io/file/markdown-checkbox-github/

\### Project status

- [x] Design
- [x] Mockups
- [x] Development
- [x] Unit testing
- [ ] QA
- [ ] Stage
- [ ] Beta Testing
- [ ] Production

- [X] Parent 1
    - [X] Child - 1
    - [X] Child - 2
    - [X] Child - 3
    - [X] Child - 4
- [ ] Parent 2
    - [ ] Child - 1
    - [ ] Child - 2
    - [ ] Child - 3
    - [ ] Child - 4

| Stage      | Time to complete  | Current Status | Finished                       | 
|------------|---------------|----------------|------------------------------------|
| Development| 2 days    | Work in progress | <ul><li>- [x] completed</li><li>- [ ] todo</li></ul>
| QA     |3 days |  Work in progress | <ul><li>[x] done</li><li>[ ] tobedone</li></ul>


# Crear un indice en markdown


**Índice**
1. [Primer apartado](#id1)
2. [Segundo apartado](#id2)
<div id='id1' />
## Primer apartado
Texto del primer apartado
<div id='id2' />
## Segundo apartado
Texto del segundo apartado



Tomar como referencia la de bcol
https://github.com/bancolombia/scaffold-clean-architecture/blob/master/README.md


# Scaffolding of Clean Architecture

Gradle plugin to create a java and kotlin application based on Clean Architecture following our best practices!

- [Scaffolding of Clean Architecture](#scaffolding-of-clean-architecture)
- [Plugin Implementation](#plugin-implementation)
- [Tasks](#tasks)

| Reference for **drivenAdapterType** | Name                                | Additional Options                                 | Java    | Kotlin  |
   |-------------------------------------|-------------------------------------|----------------------------------------------------|---------|---------|
   | generic                             | Empty Driven Adapter                | --name [name]                                      | &#9745; | &#9745; |
   | jpa                                 | JPA Repository                      | --secret [true-false]                              | &#9745; | &#9745; |
   | mongodb                             | Mongo Repository                    | --secret [true-false]                              | &#9745; | &#9745; |
   | asynceventbus                       | Async Event Bus                     |                                                    | &#9745; | &#9745; |
   | restconsumer                        | Rest Client Consumer                | --url [url]                                        | &#9745; | &#9745; |
   | redis                               | Redis                               | --mode [template-repository] --secret [true-false] | &#9745; | &#9745; |
   | rsocket                             | RSocket Requester                   |                                                    | &#9745; | &#9745; |
   | r2dbc                               | R2dbc Postgresql Client             |                                                    | &#9745; | &#9745; |
   | kms                                 | AWS Key Management Service          |                                                    | &#9745; | &#9745; |
   | secrets                             | Secrets Manager Bancolombia         |                                                    | &#9745; | &#9745; |
   | s3                                  | AWS Simple Storage Service          |                                                    | &#9745; | &#9745; |
   | mq                                  | JMS MQ Client to send messages      |                                                    | &#9745; | &#9745; |
   | ktor                                | HTTP client for kotlin              |                                                    | &#9744; | &#9745; |
   | dynamodb                            | Dynamo DB adapter                   |                                                    | &#9745; | &#9745; |
   | sqs                                 | SQS message sender                  |                                                    | &#9745; | &#9745; |





## Changelog

* __2.3.1__ : Fix embedded images in PDF generation with Docker  [@ddiegoall](https://github.com/diegoall)
* __2.3.0__ : Add Docker support to ease the installation process  [@diegoall](https://github.com/diegoall)
* __2.2.0__ : Dropped phar file distribution, removed Pake and migrated to composer commands
* __2.1.0__ : Dropped PHP5 support
* __2.0.12__ : Added new `Roboto` template from [@diegoall](https://github.com/diegoall)


Tener en cuenta que github genera Tags...



# Convertir markdown to pdf

npm install -g markdown-pdf


# Insertar formulas matemáticas (Utilizando R Markdown)

Se puede utilizar Sintaxis de Latex, al parecer es (Katex) utilizando la siguiente página:

https://latex.codecogs.com/

Se escribe y se utilizan los simbolos $ a + b = c$


# Diagramas en general (de clases)

https://mermaid-js.github.io/mermaid/#/classDiagram

https://ciberninjas.com/incluye-diagramas-en-archivos-markdown-con-mermaid/

https://docs.github.com/es/get-started/writing-on-github/working-with-advanced-formatting/creating-diagrams

geojson

https://github.com/mermaid-js/mermaid-cli

uml en markdown

https://es.linkedin.com/pulse/crear-uml-en-markdown-antonio-blanco-oliva?trk=pulse-article

PlantUML

https://mermaid-js.github.io/mermaid/#/


https://support.typora.io/Draw-Diagrams-With-Markdown/




***Formula de Gauss***

$
\sum_{i=1}^{n} i =  \frac{n(n+1)}{2}
$

$
\sum_{i=1}^{n} i =  1+2+3+...+n
$

***Ejemplos de otras formulas***

$\left[\overline{X} -z_{1-\frac{\alpha}{2}} \frac{\sigma}{\sqrt{n}}, \overline{X}+z_{1-\frac{\alpha}{2}}\frac{\sigma}{\sqrt{n}}
\right]$

$
\sum_{n=1}^{N}n^{-s}
$

$$
\left\{
\begin{array}{ll}
H_{0}: &  \mu=\mu_0\\
H_{1}: & \mu\neq\mu_0
\end{array}
\right.
$$

$
\begin{equation}
y = \int_{x=0}^{x=2 \pi + 10} f(x) \cdot dx
\end{equation}
$

$
\begin{equation}
y = \int \limits_{x=0}^{x=2 \pi + 10} f(x) \cdot dx
\end{equation}
$

$
\begin{equation}
z = \int _{y=a}^{y=b} \int _{x=g(y)}^{x=h(y)} f(x) \cdot dx \cdot dy
\end{equation} 
$

$
\begin{equation}
\oint_L = \oiint_A = \oiiint_V
\end{equation}
$

$
\begin{equation}
y = \iint f(x) = \iiint g(x)
\end{equation}
$

This sentence uses `$` delimiters to show math inline:  $\sqrt{3x-1}+(1+x)^2$

**The Cauchy-Schwarz Inequality**

$$\left( \sum_{k=1}^n a_k b_k \right)^2 \leq \left( \sum_{k=1}^n a_k^2 \right) \left( \sum_{k=1}^n b_k^2 \right)$$

**Here is some math!**

```math
\sqrt{3}
```

https://docs.github.com/es/get-started/writing-on-github/working-with-advanced-formatting/writing-mathematical-expressions

https://medium.com/@luiscarlos_40534/inserta-f%C3%B3rmulas-matem%C3%A1ticas-creadas-en-latex-con-markdown-ab59f5a68211


https://rmarkdown.rstudio.com/



https://www.youtube.com/watch?v=nd-YudmcLjQ


Fuente interesante con formulas útiles
Letras griegas y acentos matemáticos
Subíndices, superíndices, comparaciones
Fracciones
Paréntesis, corchetes y llaves
Matrices

etc


https://rpubs.com/ricardo/14631



Timeline

    2020-11-??: Discover SecureJoinVFS() comment
    2020-12-26: Initial report to security@opencontainers.org (Merry Christmas :) )
    2020-12-27: Report acknowledgment
    2021-03-06: Report to Google for their new GKE Autopilot
    2021-04-07: Got added to discussions around the fix
    2021-04-08: Google bounty :) (to be donated to Handicap International)
    2021-05-19: End of embargo, advisory published on GitHub and on OSS-Security
    2021-05-30: Write-up + POC public








> The secret to creativity is knowing how to hide your sources. 
> -- <cite>[Albert Einstein][1]</cite>

[1]: http://www.quotedb.com/quotes/2112


> Quote here.
>
> -- <cite>Benjamin Franklin</cite>




### Footnote


Here is a simple footnote[^1].

A footnote can also have multiple lines[^2].  

You can also use words, to fit your writing style more closely[^note].

[^1]: My reference.
[^2]: Every new line should be prefixed with 2 spaces.  
  This allows you to have a footnote with multiple lines.
[^note]:
    Named footnotes will still render with numbers instead of the text but allow easier identification and linking.  
    This footnote also has been made with a different syntax using 4 spaces for new lines.




<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
" target="_blank"><img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg" 
alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>


[![IMAGE ALT TEXT HERE](http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg)](http://www.youtube.com/watch?v=YOUTUBE_VIDEO_ID_HERE)




## References


https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet