#! /bin/sh

python generate.py entrypoint entrypoint.sh.j2 entrypoint-vars.yaml
python generate.py readme README.md.j2 readme-vars.yaml > README.md
