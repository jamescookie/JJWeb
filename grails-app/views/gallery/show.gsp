<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Gallery</title>

        <script type="text/javascript" src="<g:createLinkTo dir='js/jquery' file='jquery-1.2.3.pack.js'/>"></script>
        <script type="text/javascript" src="<g:createLinkTo dir='js/jquery' file='jquery.jcarousel.pack.js'/>"></script>
        <link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='css' file='jquery.jcarousel.css'/>" />
        <link rel="stylesheet" type="text/css" href="<g:createLinkTo dir='css/ie7' file='skin.css'/>" />
        <script type="text/javascript">
            <!--
                function openWin(url) {
                    var photoWindow = window.open(url, "Slideshow", "width=650,height=750,resizable=yes");
                    photoWindow.focus();
                }

                var mycarousel_itemList = [
                    <g:each in="${gallery?.thumbs}" var="photo">
                    {url: '${createLinkTo(dir: 'thumbnails/'+gallery?.name, file: photo.thumbnailName).encodeAsJavaScript()}', title: '${photo.displayName.encodeAsJavaScript()}', url2: '<g:createLink action="showPhoto" id="${gallery?.name}" params="[photo:photo.safeOriginalName]" />'},
                    </g:each>
                ];

                function mycarousel_itemVisibleInCallback(carousel, item, i, state, evt) {
                    var idx = carousel.index(i, mycarousel_itemList.length);
                    carousel.add(i, mycarousel_getItemHTML(mycarousel_itemList[idx - 1]));
                };

                function mycarousel_itemVisibleOutCallback(carousel, item, i, state, evt) {
                    carousel.remove(i);
                };

                function mycarousel_initCallback(carousel) {
                    carousel.buttonNext.bind('click', function() {
                        carousel.startAuto(0);
                    });

                    carousel.buttonPrev.bind('click', function() {
                        carousel.startAuto(0);
                    });

                    carousel.clip.hover(function() {
                        carousel.stopAuto();
                    }, function() {
                        carousel.startAuto();
                    });
                };

                function mycarousel_getItemHTML(item) {
                    var tmp = "'"+item.url2+"'"
                    return '<a href="javascript:openWin('+tmp+');"><img src="' + item.url + '" alt="' + item.title + '" /></a>';
                };

                jQuery(document).ready(function() {
                    jQuery('#mycarousel').jcarousel({
                        wrap: 'circular',
                        scroll: 1,
                        auto: 2,
                        initCallback: mycarousel_initCallback,
                        itemVisibleInCallback: {onBeforeAnimation: mycarousel_itemVisibleInCallback},
                        itemVisibleOutCallback: {onAfterAnimation: mycarousel_itemVisibleOutCallback}
                    });
                });
            //-->
        </script>
    </head>
    <body>
        <h1 class="galleryHeading">${gallery?.name}</h1>
        <div class="gallery">
            <ul id="mycarousel" class="jcarousel-skin-ie7">
              <!-- The content will be dynamically loaded in here -->
            </ul>
        </div>
    </body>
</html>
