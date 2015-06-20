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
        <div class="col-md-2">
          <img class="logo img-responsive" src="${request.static_url('pyramid_form:static/images/pyramid.png')}" alt="pyramid web framework">
        </div>
        <div class="col-md-10">
          <div class="content">
            <h1><span class="font-semi-bold"></span>Proyecto de Prueba</h1>
            <form class="form-horizontal">
            <fieldset>

            <legend>Registro Nuevo Usuario</legend>

            <!-- Alert Errors -->
            % if form:
              % for error in form.errors:
                <div class="alert alert-danger" role="alert">${ error }</div>
              % endfor
            % endif

            % if form:
              % for field in form:
                <div class="form-group">
                  <!-- Text input-->
                  <label class="col-md-4 control-label" for="nombre">${ field.label }</label>
                  <div class="col-md-4">
                    <input id="${ field.id }" name="${ field.name }" placeholder="${ field.label }" class="form-control input-md" type="text">
                    ${field(class_='form-control input-md')}
                    <span class="help-block">${ field.description }</span>
                  </div>
                </div>
              % endfor
            % endif

            <!-- Textarea -->
            <div class="form-group">
              <label class="col-md-4 control-label" for="textarea">Text Area</label>
              <div class="col-md-4">                     
                <textarea class="form-control" id="textarea" name="textarea">default text</textarea>
              </div>
            </div>

            <div class="form-group">
            	<div class="col-md-4"></div>
            	<div class="col-md-8">
            	<a class="btn btn-lg btn-success" href="#" type="submit" role="button">Guardar</a>
            	<a class="btn btn-lg btn-default" href="#" type="reset" role="button">Limpiar</a>
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
