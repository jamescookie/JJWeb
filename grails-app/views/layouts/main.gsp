<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en">
    <head>
        <title><g:layoutTitle default="James and Jack" /></title>
        <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'main.css')}" />
        <link rel="stylesheet" type="text/css" href="${createLinkTo(dir:'css',file:'site.css')}" />
        <link rel="shortcut icon" href="${createLinkTo(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body onload="<g:pageProperty name='body.onload'/>" onunload="<g:pageProperty name='body.onunload'/>">
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${createLinkTo(dir:'images',file:'spinner.gif')}" alt="Spinner" />
        </div>	
        <g:layoutBody />		
    </body>	
</html>