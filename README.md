# Wiremock Dynamic using Docker

This project has the structure of mocked APIs, which can be used in UI automated tests or manual testing when third-party systems are down.

## 🔧 Tools & Technologies

This project applies the framework [Wiremock](http://wiremock.org/docs/), which responses can be dynamics, used with [Docker](https://hub.docker.com/r/rodolpheche/wiremock).

> **NOTE 1:** [Click here to support in regex](https://regexr.com/)

## 📦 Project organization

The project has the following structure:
  
  ```
      ├──[project_name]
      │  ├──stubs
      │  │  ├──__files
      │  │  │  └──[json_response_files]
      │  │  ├──mappings
      │  │  │  └──[json_api_files]
  ```

## 🚀 Running with Docker
Download and install [Docker](https://www.docker.com/products/docker-desktop).

### Build
```sh
$ docker build -t YOUR_IMAGE_NAME .
```
### Run http
```sh
$ docker run -it --rm -p 8080:8080 YOUR_IMAGE_NAME
```

### Run https
```sh
$ docker run -it --rm -p 8443:8443 YOUR_IMAGE_NAME --https-port 8443 --verbose
```
> **NOTE 1:** Replace **YOUR_IMAGE_NAME**.

> **NOTE 2:** Using mock for **Android** must be https.

### 💬 Some Docker command line
| Command line | Explanation |
| ------ | ------ |
| docker system prune -a | Clear all dependecies |
| docker ps -a | List all running and stopped containers |
| docker rm ID_CONTAINER | Remove a container |
| docker stop ID_CONTAINER | Stop a container |
| docker imagens | List all imagens |
| docker rmi ID_IMAGE | Remove an imagem |
| docker exec -it ID_CONTAINER bash | Login a container |

> **NOTE 2:** Use **docker ps -a** to show the ID_CONTAINER.

> **NOTE 3:** Use **docker images** to show the ID_IMAGE.
