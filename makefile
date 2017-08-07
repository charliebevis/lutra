default: elm-build

mkfile_path := $(abspath $(lastword $(MAKEFILE_LIST)))
project_root := $(dir $(mkfile_path))

elm-build:
	/usr/local/bin/elm-make $(project_root)src/Main.elm --output=$(project_root)index.html

css: elm-build
	/usr/local/bin/elm-css $(project_root)src/Stylesheets.elm --output=$(project_root)src/assets/styles/

build-prod:
	rm -rf dist && $(project_root)node_modules/webpack/bin/webpack.js && touch dist/Staticfile

deploy:
	cd dist && cf push lutra -m 64M

dev-server:
	npm start
