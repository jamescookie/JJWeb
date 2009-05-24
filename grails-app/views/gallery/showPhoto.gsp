<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="nonav" />
        <title>James and Jack's Photos</title>
    </head>
    <body>
        <div class="body">
            <table class="maxDimensions">
              <tr valign="top">
                <td style="text-align:center" colspan="3"><h1>${gallery}</h1></td>
              </tr>
              <tr valign="top">
                <td>
                  <a href="<g:createLink action="showPhoto" id="${gallery}" params="[photo:photo.previous]" />">
                    &lt;&lt;&nbsp;Previous
                  </a>
                </td>
                <td style="text-align:center;width:100%"><h2>${photo.displayName}</h2></td>
                <td align="right">
                  <a href="<g:createLink action="showPhoto" id="${gallery}" params="[photo:photo.next]" />">
                    Next&nbsp;&gt;&gt;
                  </a>
                </td>
              </tr>
              <tr valign="top">
                <td style="height:100%" valign="top" align="center" colspan="3">
                  <img alt="${photo.displayName}" src="<g:createLink action="renderPhoto" id="${gallery}" params="[photo:photo.originalName]" />"/>
                </td>
              </tr>
            </table>
        </div>
    </body>
</html>
