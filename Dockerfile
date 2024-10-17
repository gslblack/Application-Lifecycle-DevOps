# Use a imagem OpenJDK 18 como base
FROM openjdk:18-jdk-slim AS build

# Instala Maven
RUN apt-get update && apt-get install -y maven

# Defina o diretório de trabalho para o build
WORKDIR /app

# Copie o arquivo pom.xml e as dependências primeiro (para fazer cache das dependências)
COPY pom.xml .

# Baixe as dependências necessárias do Maven (fase de cache)
RUN mvn dependency:go-offline -B

# Copie o restante do código para o contêiner
COPY src ./src

# Execute o build do Maven (gera o arquivo .jar na pasta target)
RUN mvn package -DskipTests

# Use uma imagem mais leve para rodar a aplicação
FROM openjdk:18-jdk-slim

# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo JAR do build anterior para o contêiner
COPY --from=build /app/target/gestao-residuos-automacao-1.0.0.jar ./gestao-residuos-automacao-1.0.0.jar

# Defina a porta que o contêiner vai expor
EXPOSE 8080

# Comando a ser executado quando o contêiner for iniciado
CMD ["java", "-jar", "gestao-residuos-automacao-1.0.0.jar"]
