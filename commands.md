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
```

```bash
mkdir src
echo "console.log('Hello World\!\!\!')" > src/app.ts
```

```bash
yarn tsc
```

```bash
yarn add express @types/express
```