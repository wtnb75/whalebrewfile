import os
import glob
from jinja2 import Template
import yaml
import click
from logging import getLogger

log = getLogger(__name__)


@click.group(invoke_without_command=True)
@click.pass_context
def cli(ctx):
    from logging import basicConfig, DEBUG
    basicConfig(format="%(asctime)s %(levelname)s %(message)s", level=DEBUG)
    if ctx.invoked_subcommand is None:
        print(ctx.get_help())


def render_tmpl(tmpl, data):
    tmpl = Template(tmpl)
    return tmpl.render(**data)


@cli.command()
@click.option("--filename", default="entrypoint.sh", show_default=True)
@click.argument("template", type=click.File('r'))
@click.argument("variables", type=click.File('r'))
def entrypoint(template, variables, filename):
    tmpl = template.read()
    data = yaml.safe_load(variables)
    for k, v in data.items():
        if not os.path.isdir(k):
            log.error("dir %s not found", k)
            continue
        fname = os.path.join(k, filename)
        with open(fname, 'w') as ofp:
            log.debug("output %s", fname)
            v["name"] = k
            print(render_tmpl(tmpl, v), file=ofp)
        os.chmod(path=fname, mode=0o755)


@cli.command()
@click.argument("template", type=click.File('r'))
@click.argument("variables", type=click.File('r'))
def readme(template, variables):
    tmpl = template.read()
    data = yaml.safe_load(variables)
    # load workflows
    data["images"] = {}
    allbuild = set([os.path.dirname(x) for x in glob.glob("*/Dockerfile")])
    sub_readmes = set([os.path.dirname(x) for x in glob.glob("*/README.md")])
    for f in glob.glob(".github/workflows/*.yml"):
        platforms = None
        images = None
        with open(f) as ifp:
            workflow = yaml.safe_load(ifp)
            for name, v in workflow.get("jobs", {}).items():
                for step in v.get("steps", []):
                    if step.get("uses", "").startswith("docker/build-push-action"):
                        platforms = [x.split("/", 1)[-1] for x in step.get("with", {}).get("platforms", "").split(",")]
                        break
                else:
                    continue
                images = v.get("strategy", {}).get("matrix", {}).get("images", [])
        if platforms is not None and images is not None:
            for i in images:
                data["images"][i] = {"platforms": platforms}
    # non-category
    imgs = set(data["images"].keys())
    cats = set()
    for v in data.get("categories", {}).values():
        cats.update(v)
    data["categories"]["misc"] = sorted(list(imgs - cats))
    data["categories"]["TODO"] = sorted(list(allbuild - imgs - cats))
    data["readmes"] = sub_readmes
    print(render_tmpl(tmpl, data))


if __name__ == "__main__":
    cli()
