# Playwright Electron Decker example

This is a boilerplate project used for running playwright tests for an electron app running on a docker container.

The example is a simple Electron app which uses multiple windows.

## Running the Example App

```
npm i
npm run build
./dist/win-unpacked/electron-multi-window
```

## Running the Playwright Tests

To run locally:

```
npm run test:pw
```

## Run Tests on a Docker Container

Ensure the docker daemon is running, then:

```
docker build -t playwright-electron:1.0.0 .
./startup.sh
```
