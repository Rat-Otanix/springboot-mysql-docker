##### Stage 1 - Lets build the "deployable package"

FROM maven:3.6.1-jdk-8-alpine as springboot-build
WORKDIR /src/application

### Step 1 - Copy pom.xml and download project dependencies

# Dividing copy into two steps to ensure that we download dependencies 
# only when pom.xml changes
COPY pom.xml .
# dependency:go-offline - Goal that resolves all project dependencies, 
# including plugins and reports and their dependencies. -B -> Batch mode
RUN mvn dependency:go-offline -B

### Step 2 - Copy source and build "deployable package"
COPY src src
RUN mvn install -DskipTests

# Unzip
RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

##### Stage 2 - Let's build a minimal image with the "deployable package"
FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG DEPENDENCY=/src/application/target/dependency
COPY --from=springboot-build ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=springboot-build ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=springboot-build ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.example.employeeservicespringboot.restfulwebservices.EmployeeServiceSpringbootApplication"]