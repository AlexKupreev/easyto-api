import click
from flask.cli import FlaskGroup

from easyto_api.app import create_app


def create_easyto_api(info):
    return create_app(cli=True)


@click.group(cls=FlaskGroup, create_app=create_easyto_api)
def cli():
    """Main entry point"""


@cli.command("init")
def init():
    """Create a new admin user
    """
    from easyto_api.extensions import db
    from easyto_api.models import User

    click.echo("create user")
    user = User(
        username="admin", email="admin@example.com", password="password", active=True
    )
    db.session.add(user)
    db.session.commit()
    click.echo("created user admin")


if __name__ == "__main__":
    cli()
