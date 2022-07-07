#!/bin/bash

cd ..

npm_config_yes=true npx create-react-app react-ts-project --template typescript

mv react-ts-project src
