# command list

## initial setup

```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
nvm install --lts
curl -o- -L https://yarnpkg.com/install.sh | bash
```

## project setup

```bash
mkdir api-example
cd api-example
```

```bash
yarn init
yarn add @types/node typescript
yarn add -D ts-node
yarn tsc --init --rootDir src --outDir ./bin --esModuleInterop --lib ES2019 --module commonjs --noImplicitAny true
yarn add express @types/express
yarn add connect express-openapi-validator swagger-routes-express validator yamljs @types/validator @types/yamljs
```
