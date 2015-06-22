# -*- coding: utf-8 -*-
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
        try:
            correo_query = DBSession.query(Person).filter_by(correo=request.POST['correo']).one()
            if correo_query.correo == request.POST['correo']:
                return {"form": form, "invalid": True}
        except:
            pass
        form.populate_obj(person)
        DBSession.add(person)
        return {"form": form, "guardado": 'Registro guardado con éxito'}

    return {"form": form}
