from pyramid.view import view_config
from pyramid.httpexceptions import HTTPFound

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

    if request.method == 'POST' and form.validate():
        form.populate_obj(person)
        DBSession.add(person)
        return HTTPFound(location=request.route_url('home'))

    return {"form": form}
