<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gallery List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
        </div>
        <div class="body">
            <h1>Gallery List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <tbody>
                    <g:each in="${galleryList}" status="i" var="gallery">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${gallery}">${gallery?.encodeAsHTML()}</g:link></td>
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div>&nbsp;</div>
            <div>
                <g:link action="ourWorld">View places we have visited around the world</g:link>
            </div>
        </div>
    </body>
</html>
