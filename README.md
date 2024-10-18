
# Application Lifecycle DevOps

Este projeto é uma aplicação que utiliza Java com Maven, além de Docker Compose para orquestração de containers. Também há integração contínua (CI) configurada com GitHub Actions para executar testes automatizados e verificações de containers.

## Requisitos

- Java 17 (Temurin ou outra distribuição compatível)
- Maven
- Docker e Docker Compose

## Configuração do Ambiente

### Instalar Dependências

1. **Java 17**: Instale o JDK 17. Você pode usar a distribuição [Temurin](https://adoptium.net/) ou qualquer outra distribuição compatível com Java 17.
2. **Maven**: Certifique-se de ter o Maven instalado. Você pode baixar o Maven em [https://maven.apache.org/](https://maven.apache.org/).
3. **Docker & Docker Compose**: Instale o Docker e Docker Compose, se ainda não estiverem instalados:
   - [Docker Installation Guide](https://docs.docker.com/get-docker/)
   - [Docker Compose Installation Guide](https://docs.docker.com/compose/install/)

## Como Executar

### Build e Testes

Para compilar o projeto e rodar os testes, execute o seguinte comando:

```bash
mvn clean install
```

### Executar com Docker Compose

O Docker Compose está configurado para orquestrar os containers necessários. Para iniciar os serviços, execute:

```bash
docker-compose up --build
```

Isso irá construir e subir os containers definidos no arquivo `docker-compose.yml`.

### Verificar Status dos Containers

Para verificar o status dos containers após o start:

```bash
docker-compose ps
```

## Integração Contínua (CI)

Este projeto está configurado com GitHub Actions para integração contínua. A cada push nas branches `staging` ou `producao`, os seguintes passos são executados:

1. **Checkout do código**: O código é baixado do repositório.
2. **Instalação do Java**: O JDK 17 é configurado para o ambiente.
3. **Execução dos testes Maven**: Os testes unitários são executados com Maven.
4. **Verificação do Docker Compose**: O status dos containers Docker é verificado.

## Estrutura do Projeto

- **src/main/java**: Código-fonte principal da aplicação.
- **src/test/java**: Testes unitários da aplicação.
- **docker-compose.yml**: Arquivo de orquestração Docker Compose.



