<html>
%{--<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->--}%
%{--<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->--}%
%{--<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->--}%
%{--<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->--}%
%{--<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->--}%
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="GA"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
		<link rel="shortcut icon" href="${assetPath(src: 'favicon.ico')}" type="image/x-icon">
		%{--<link rel="apple-touch-icon" href="${assetPath(src: 'apple-touch-icon.png')}">--}%
		%{--<link rel="apple-touch-icon" sizes="114x114" href="${assetPath(src: 'apple-touch-icon-retina.png')}">--}%

  		<asset:stylesheet src="application.css"/>
		<asset:javascript src="application.js"/>
		%{--<script type="text/javascript">--}%
			%{--function resize() {--}%
				%{--var opa = document.getElementsByClassName("tudo")[0];--}%
				%{--if (opa.clientHeight < $(window).height()) opa.style.height = $(window).height();--}%
				%{--alert("Hello! I am an alert box!!");--}%
			%{--}--}%
			%{--window.onload = resize();--}%
			%{--$(function(){--}%
				%{--resize();--}%
			%{--});--}%

			%{--document.addEventListener("DOMContentLoaded", function() {--}%
				%{--resize();--}%
			%{--});--}%
		%{--</script>--}%

		<g:layoutHead/>
	</head>
	<body class="cresce">
		<div class="tudo">
			<div id="grailsLogo" role="banner">
				%{--<div class="container">--}%

					%{--<div class="col-md-4 col-md-offset-4">--}%
						%{--<div class="container">--}%
							%{--<div class="col-md-4">--}%
								<img class="regimage" src="http://www.globalarchives.net/wp-content/uploads/2012/06/GA_only_icon.jpg">
							%{--</div>--}%
							<h2> "Gestao de Atletas"</h2>
						%{--</div>--}%
					%{--</div>--}%

				%{--</div>--}%
			</div>
			<g:layoutBody/>
		</div>

		<footer class="footer tail" role="contentinfo">
			<p>© GA - Gestão de Atletas</p>
		</footer>

		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
	</body>
</html>
