# Graphene3 Starlette Microservice Template

## Build

```bash
docker build . --tag graphene3-starlette-microservice:latest
```

## Run

### Development

```bash
uvicorn --app-dir app --port 3000 --reload main:app
```

### Production

```bash
docker run -d -p 3000:3000 graphene3-starlette-microservice:latest
```