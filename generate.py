import os
from jinja2 import Template
import yaml
import click
from logging import getLogger

log = getLogger(__name__)


def render_tmpl(tmpl, data):
    tmpl = Template(tmpl)
    return tmpl.render(**data)


@click.command()
@click.option("--filename", default="entrypoint.sh", show_default=True)
@click.argument("template", type=click.File('r'))
@click.argument("variables", type=click.File('r'))
def main(template, variables, filename):
    from logging import basicConfig, DEBUG
    basicConfig(format="%(asctime)s %(levelname)s %(message)s", level=DEBUG)
    tmpl = template.read()
    data = yaml.safe_load(variables)
    for k, v in data.items():
        if not os.path.isdir(k):
            log.error("dir %s not found", k)
            continue
        fname = os.path.join(k, filename)
        with open(fname, 'w') as ofp:
            log.debug("output %s", fname)
            print(render_tmpl(tmpl, v), file=ofp)
        os.chmod(path=fname, mode=0o755)


if __name__ == "__main__":
    main()
