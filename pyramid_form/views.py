from pyramid.response import Response
from pyramid.view import view_config

from sqlalchemy.exc import DBAPIError

from .models import (
    DBSession,
    Person,
    )
from .forms import PersonCreateForm


@view_config(route_name='home', renderer='templates/create_person.mako')
def person_create(request):
    person = Person()
    form = PersonCreateForm(request.POST)

    if 'submit' in request.POST and form.validate():
        form.populate_obj(entry)
        DBSession.add(entry)
        return HTTPFound(location=request.route_url('home'))

    return {"form": form}

