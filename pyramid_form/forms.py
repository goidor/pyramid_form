# -*- coding: utf-8 -*-
from wtforms import Form, TextField, TextAreaField, validators


strip_filter = lambda x: x.strip() if x else None

class PersonCreateForm(Form):
    nombre = TextField('Nombre', [validators.Length(min=1, max=200)],
                       filters=[strip_filter],
                       description="Solo su nombre Ej. Rodrigo ")
    apellido = TextField('Apellido', [validators.Length(min=1, max=200)],
                       filters=[strip_filter],
                       description="Solo su nombre. Ej. Bravo")
    correo = TextField('Correo Electrónico', [validators.Length(min=5, max=200)],
                       filters=[strip_filter],
                       description="Ej. email@correo.com")
    telefono = TextField('Teléfono', [validators.Length(min=10, max=20)],
                       filters=[strip_filter],
                       description="Debe ser solo números Ej. 4585552277")
    direccion = TextAreaField('Dirección', [validators.Length(min=1)],
                       filters=[strip_filter])
