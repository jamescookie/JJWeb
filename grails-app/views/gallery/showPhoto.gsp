<html>
    <head>
        <link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='css' file='jquery.jcarousel.css'/>"/>
        <link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='css/ie7' file='skin.css'/>"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="nonav" />
        <title>James and Jack's Photos</title>
    </head>
    <body style="background-color: #D4D0C8">
        <div class="jcarousel-skin-ie7">
            <div class="jcarousel-container" style="border:none;">
                <table class="maxDimensions">
                    <tr valign="top">
                        <td style="text-align:center" colspan="3"><h1>${gallery}</h1></td>
                    </tr>
                    <tr valign="top">
                        <td>
                            <a class="jcarousel-prev jcarousel-prev-horizontal" style="display: block; top: inherit; position: inherit;" title="Previous" href="<g:createLink action="showPhoto" id="${gallery}" params="[photo:photo.previous]"/>"><span style="display:none;">&nbsp;</span></a>
                        </td>
                        <td style="text-align:center;vertical-align:middle;width:100%;"><h2>${photo.displayName}</h2></td>
                        <td align="right">
                            <a class="jcarousel-next jcarousel-next-horizontal" style="display: block; top: inherit; position: inherit;" title="Next" href="<g:createLink action="showPhoto" id="${gallery}" params="[photo:photo.next]"/>"><span style="display: none">&nbsp;</span></a>
                        </td>
                    </tr>
                    <tr valign="top">
                        <td style="height:100%" valign="top" align="center" colspan="3">
                            <img alt="${photo.displayName}" src="<g:createLink action="renderPhoto" id="${gallery}" params="[photo:photo.originalName]"/>"/>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </body>
</html>
