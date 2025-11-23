# Commands are run at the parent level of the project
mvn spring-boot:run # runs the localhost:8080 server for your endpoint apis
mvn clean install -U # resolves dependency issues
rm -rf ~/.m2/repository/org/springframework/boot # clears cache of Maven project
mvn -v # gets Maven version
mvn clean install # Build app with maven

# spring-boot-app/   <----- This is where Maven commands are run! At the VERY TOP!
#  |---/src/
#        |---/main/
#             |---/java/

/* Maven Spring-Boot project layout
my-spring-boot-app/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           ├── Application.java
│   │   │           ├── controller/
│   │   │           │   └── BlogController.java
│   │   │           ├── model/
│   │   │           │   └── Blog.java
│   │   │           └── service/
│   │   │               └── BlogService.java
│   │   ├── resources/
│   │   │   ├── application.properties
│   │   │   ├── static/
│   │   │   └── templates/
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── ApplicationTests.java
├── pom.xml (or build.gradle)
└── .gitignore
*/
