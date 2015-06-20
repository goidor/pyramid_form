<!DOCTYPE html>
<html lang="${request.locale_name}">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="pyramid web application">
    <meta name="author" content="Pylons Project">
    <link rel="shortcut icon" href="${request.static_url('pyramid_form:static/pyramid-16x16.png')}">

    <title>Formulario</title>

    <!-- Bootstrap core CSS -->
    <link href="${request.static_url('pyramid_form:static/bootstrap/css/bootstrap.min.css')}" rel="stylesheet">

  </head>

  <body>
    <div class="container">
      <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-10">
          <div class="content">
            <h1><span class="font-semi-bold"></span>Proyecto de Prueba</h1>
            <form class="form-horizontal" action="${ request.route_url('home') }" method="post">
            <fieldset>

            <legend>Registro Nuevo Usuario</legend>

            <!-- Alert Errors -->
            % if form.errors:
              % for field_name in form.errors:
                % for error in form[field_name].errors:
                  <div class="alert alert-danger alert-dismissible" role="alert">
                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                    </button>
                    ${ form[field_name].label }: ${ error }
                  </div>
                % endfor
              % endfor
            % endif

            <div class="form-group">
              ${ form.nombre.label(class_='col-md-4 control-label') }
              <div class="col-md-4">
                ${ form.nombre(class_='form-control input-md', minlength=2, maxlength=200, placeholder='Nombre', required='required') }
                <span class="help-block">${ form.nombre.description }</span>
              </div>
            </div>

            <div class="form-group">
              ${ form.apellido.label(class_='col-md-4 control-label') }
              <div class="col-md-4">
                ${ form.apellido(class_='form-control input-md', minlength=2, maxlength=200, placeholder='Apellido', required='required') }
                <span class="help-block">${ form.apellido.description }</span>
              </div>
            </div>

            <div class="form-group">
              ${ form.correo.label(class_='col-md-4 control-label') }
              <div class="col-md-4">
                ${ form.correo(class_='form-control input-md', minlength=5, maxlength=200, placeholder='Correo Electrónico', required='required') }
                <span class="help-block">${ form.correo.description }</span>
              </div>
            </div>

            <div class="form-group">
              ${ form.telefono.label(class_='col-md-4 control-label') }
              <div class="col-md-4">
                ${ form.telefono(class_='form-control input-md', maxlength=20, placeholder='Teléfono') }
                <span class="help-block">${ form.telefono.description }</span>
              </div>
            </div>

            <div class="form-group">
              ${ form.direccion.label(class_='col-md-4 control-label') }
              <div class="col-md-4">
                ${ form.direccion(class_='form-control input-md', placeholder='Dirección de Residencia') }
                <span class="help-block">${ form.direccion.description }</span>
              </div>
            </div>


            <div class="form-group">
            	<div class="col-md-4"></div>
            	<div class="col-md-8">
            	<button class="btn btn-lg btn-success" type="submit">Guardar</button>
            	</div>
            </div>

            </fieldset>
            </form>
          </div>
        </div>
      </div>
    </div>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="${request.static_url('pyramid_form:static/js/jquery.js')}"></script>
    <script src="${request.static_url('pyramid_form:static/bootstrap/js/bootstrap.min.js')}"></script>
  </body>
</html>
