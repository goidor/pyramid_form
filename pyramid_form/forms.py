# -*- coding: utf-8 -*-
from wtforms import TextField, TextAreaField, IntegerField, validators
#from wtforms.ext.i18n.form import Form
from wtforms.form import Form


strip_filter = lambda x: x.strip() if x else None

class PersonCreateForm(Form):
    nombre = TextField('Nombre',
                       [validators.Length(min=2, max=100), validators.required()],
                       filters=[strip_filter],
                       description="Solo su nombre Ej. Rodrigo ")
    apellido = TextField('Apellido',
                        [validators.Length(min=2, max=100), validators.required()],
                        filters=[strip_filter],
                        description="Solo su nombre. Ej. Bravo")
    correo = TextField('Correo Electrónico',
                       [validators.Length(min=5, max=120), validators.required(), validators.Email()],
                       filters=[strip_filter],
                       description="Ej. email@correo.com")
    telefono = IntegerField('Teléfono', [validators.optional()],
                        description="Debe ser solo números Ej. 4585552277")
    direccion = TextAreaField('Dirección', [validators.optional()],
                        filters=[strip_filter])
