<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gallery List</title>
        <resource:treeView />
        <style type="text/css">
        td.ygtvcell {
            vertical-align: middle;
            font-size: 15px;
            padding: 2px;
        }
        </style>
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
                <jjweb:treeView xml="${galleryList}" onLabelClick="if(node.children.length == 0) document.location.href = '${createLinkTo(dir: 'gallery/show')}/' + escape(id);"/>
            </div>
            <div>&nbsp;</div>
            <div>
                <g:link action="ourWorld">View places we have visited around the world</g:link>
            </div>
        </div>
    </body>
</html>
