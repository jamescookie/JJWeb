<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gallery</title>
        <script type="text/javascript">
        <!--
            function openWin(url) {
                var photoWindow = window.open(url, "Slideshow", "width=650,height=750,resizable=yes");
                photoWindow.focus();
            }
        //-->
        </script>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Gallery List</g:link></span>
        </div>
        <div class="body">
            <h1>${gallery?.name}</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <g:def var="NUMBER_OF_PHOTOS_PER_ROW" value="${4}"/>
                <g:def var="WIDTH_PER_COL" value="${100 / NUMBER_OF_PHOTOS_PER_ROW}"/>
                <g:def var="i" value="${0}"/>
                <g:def var="j" value="${0}"/>
                <table width="100%">
                    <tr>
                        <g:each in="${gallery?.thumbs}" var="photo">
                            <g:if test="${i % NUMBER_OF_PHOTOS_PER_ROW == 0 && i > 0}">
                                </tr>
                                <tr>
                                <g:set var="j" value="${i - NUMBER_OF_PHOTOS_PER_ROW}"/>
                                <g:while test="${j < i}">
                                    <td style="text-align: center" width="${WIDTH_PER_COL}%">
                                        ${gallery?.thumbs[j].displayName}
                                    </td>
                                    <g:set var="j" value="${j++}"/>
                                </g:while>
                                </tr>
                                <tr>
                                    <td colspan="${NUMBER_OF_PHOTOS_PER_ROW}">&nbsp;</td>
                                </tr>
                                <tr>
                            </g:if>
                            <td style="text-align: center" valign="middle" width="${WIDTH_PER_COL}%">
                                <a href="javascript:openWin('<g:createLink action="showPhoto" id="${gallery?.name}" params="[photo:photo.safeOriginalName]" />');">
                                    <img src="${createLinkTo(dir: 'thumbnails/'+gallery?.name?.replace('|', '/'), file: photo.thumbnailName)}" border="0" alt="${photo.displayName}"/>
                                </a>
                            </td>
                            <g:set var="i" value="${i++}"/>
                        </g:each>
                        <g:if test="${i % NUMBER_OF_PHOTOS_PER_ROW != 0}">
                            <td colspan="${NUMBER_OF_PHOTOS_PER_ROW - (i % NUMBER_OF_PHOTOS_PER_ROW)}">&nbsp;</td>
                        </g:if>
                    </tr>
                    <tr>
                        <g:if test="${i > 0}">
                            <g:set var="j" value="${i - (i % NUMBER_OF_PHOTOS_PER_ROW)}"/>
                            <g:if test="${j == i}">
                                <g:set var="j" value="${i - NUMBER_OF_PHOTOS_PER_ROW}"/>
                            </g:if>
                            <g:while test="${j < i}">
                                <td style="text-align: center" width="${WIDTH_PER_COL}%">
                                    ${gallery?.thumbs[j].displayName}
                                </td>
                                <g:set var="j" value="${j++}"/>
                            </g:while>
                            <g:if test="${i % NUMBER_OF_PHOTOS_PER_ROW != 0}">
                                <td colspan="${NUMBER_OF_PHOTOS_PER_ROW - (i % NUMBER_OF_PHOTOS_PER_ROW)}">&nbsp;</td>
                            </g:if>
                        </g:if>
                    </tr>
                </table>
            </div>
            ${gallery?.additionalHTML}
        </div>
    </body>
</html>
