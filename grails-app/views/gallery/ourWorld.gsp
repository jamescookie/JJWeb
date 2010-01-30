<html>
  <head>
    <title>Our World</title>
    <meta name="layout" content="main" />
    <style type="text/css">
      .popupTitle { font-weight: bold; }
      .popupPhoto { margin-top:5px; }
      .popupFooter { margin-top:10px; font-size:10pt; }
    </style>
    <script src="http://maps.google.com/maps?file=api&amp;v=2&amp;sensor=false&amp;key=${mapkey}" type="text/javascript"></script>
    <script type="text/javascript">
    //<![CDATA[
    var smallIcon = new GIcon();
    smallIcon.image = "http://${host}/images/maps/smallRedMarker.png";
    smallIcon.shadow = "http://${host}/images/maps/smallShadow.png";
    smallIcon.iconSize = new GSize(12, 20);
    smallIcon.shadowSize = new GSize(22, 20);
    smallIcon.iconAnchor = new GPoint(6, 20);
    smallIcon.infoWindowAnchor = new GPoint(5, 1);

    var bigIcon = new GIcon();
    bigIcon.image = "http://${host}/images/maps/redMarker.png";
    bigIcon.shadow = "http://${host}/images/maps/bigShadow.png";
    bigIcon.iconSize = new GSize(20, 34);
    bigIcon.shadowSize = new GSize(37, 34);
    bigIcon.iconAnchor = new GPoint(6, 34);
    bigIcon.infoWindowAnchor = new GPoint(5, 1);

    var bigGreenIcon = new GIcon(bigIcon);
    bigGreenIcon.image = "http://${host}/images/maps/greenMarker.png";

    var smallPinkIcon = new GIcon(smallIcon);
    smallPinkIcon.image = "http://${host}/images/maps/smallPinkMarker.png";

    var smallBlueIcon = new GIcon(smallIcon);
    smallBlueIcon.image = "http://${host}/images/maps/smallBlueMarker.png";

    var smallLightBlueIcon = new GIcon(smallIcon);
    smallLightBlueIcon.image = "http://${host}/images/maps/smallLightBlueMarker.png";

    var map;
    var points = new Array();

    function createMarker(point,html,icon) {
        var marker = new GMarker(point,icon);
        GEvent.addListener(marker, "click", function() {
          marker.openInfoWindowHtml(html);
        });
        return marker;
    }

    function addMarker(latitude, longitude, html, icon, photo) {
        var point = new GLatLng(latitude, longitude);
        var pointsLength = points.length;
        points[pointsLength] = point;
        var titleHtml = "<div class='popupTitle'>" + html + "<\/div>";
        var footerHtml = "<div class='popupFooter'><a href='javascript:;' onclick='zoomTo(" + pointsLength + "); return false;'>Zoom in<\/a><\/div>";
        var photoHtml = "";
        if (photo && photo != null) {
            photoHtml = "<div class='popupPhoto'><a href='javascript:;' onclick='openWin(\"" + photo + "\"); return false;'>View photo<\/a><\/div>";
        }
        map.addOverlay(createMarker(point, titleHtml + photoHtml + footerHtml, icon));
    }

    function zoomTo(arrayIndex) {
        var zoom = 17;
        if (G_SATELLITE_MAP.getMaximumResolution(0) < zoom) {
          zoom = G_SATELLITE_MAP.getMaximumResolution(0);
        }

        map.setCenter(points[arrayIndex], zoom - 4, G_SATELLITE_MAP);
    }

    function openWin(photo) {
        var photoWindow = window.open("http://${host}/images/worldphotos/"+photo, "WorldPhoto", "width=350,height=350,resizable=yes");
        photoWindow.focus();
    }

    function doLoad() {
        if (GBrowserIsCompatible()) {
            map = new GMap2(document.getElementById("map"));
            map.addControl(new GLargeMapControl());
            map.addControl(new GMapTypeControl());
            var centerPoint = new GLatLng(28, 0);
            map.setCenter(centerPoint, 2, G_SATELLITE_MAP);

            addMarker(50.81958780746226, -0.11685848236083984, "Birth place", smallBlueIcon);
            addMarker(50.83240342792674, -0.17864584922790527, "Birth - Oct 1977", smallBlueIcon);
            addMarker(50.831258230062986, -0.20185232162475586, "Oct 1977 - Sep 1992", smallBlueIcon);
            addMarker(51.63341876516423, -0.06609499454498291, "Sep 1992 - Sep 1993", smallBlueIcon);
            addMarker(51.62872039459409, -0.13983428478240967, "Sep 1993 - Sep 1994", smallBlueIcon);
            addMarker(51.62929647896119, -0.04301190376281738, "Sep 1994 - Aug 1998", smallBlueIcon);
            addMarker(51.502313168711545, -0.30716389417648315, "Aug 1998 - Jan 1999", smallBlueIcon);
            addMarker(51.59793919849067, -0.23489177227020264, "Jan 1999 - Nov 2002", smallBlueIcon);
            addMarker(51.522295922078364, -0.3161197900772095, "Nov 2002 - Mar 2004", smallBlueIcon);

            addMarker(50.37869626627569, -4.12961483001709, "Birth place", smallPinkIcon);

            addMarker(51.37921079429734, -0.18342554569244385, "Boys Birth place", smallLightBlueIcon);

            addMarker(51.368230493968035, -0.13124048709869385, "Current abode<br/>Oct 2004 - ?", smallIcon);
            addMarker(51.417689690776456, -0.19297689199447632, "Our first house together<br/>Mar 2004 - Oct 2004", smallIcon);

            addMarker(28.41623925726764, -16.543800830841064, "Puerto de la Cruz<br/>Tenerife<br/>Nov 2003", bigIcon);
            addMarker(42.54391166083557, 1.7337799072265625, "Pas de la Casa<br/>Andorra<br/>Apr 2004", bigIcon, "andorra.jpg");
            addMarker(13.177473982273083, -59.635189175605774, "Barbados<br/>June 2004", bigIcon, "barbados.jpg");
            addMarker(37.72857010460268, 20.87325096130371, "Zante<br/>Oct 2004", bigIcon, "zante.jpg");
            addMarker(33.606184465997615, -7.631635665893555, "Casablanca<br/>Morocco<br/>June 2005", bigIcon, "casablanca.jpg");
            addMarker(34.69744912172198, 33.09425354003906, "Limassol<br/>Cyprus<br/>Nov 2005", bigIcon, "cyprus.jpg");
            addMarker(35.17563242422206, 33.358097076416016, "Nicosia<br/>Cyprus (Turkish Side)<br/>Nov 2005", bigGreenIcon, "nicosia.jpg");
            addMarker(50.116780711007785, -122.94593811035156, "Whistler<br/>Canada<br/>Feb 2005", bigIcon, "whistler.jpg");
            addMarker(21.27867751387073, -157.83276557922363, "Waikiki beach<br/>Oahu<br/>Hawaii<br/>Feb 2005", bigIcon, "oahu.jpg");
            addMarker(19.25888900386699, -155.21364212036133, "National Park<br/>Big Island<br/>Hawaii<br/>Feb 2005", bigGreenIcon, "hawaii.jpg");
            addMarker(49.28454768542656, -123.11205804347992, "Vancouver<br/>Canada<br/>Feb 2005", bigGreenIcon, "vancouver.jpg");
            addMarker(36.13223385427301, -5.35034716129303, "Gibraltar<br/>Jan 2006", bigIcon, "gibraltar.jpg");
            addMarker(28.868698520506832, -13.84177565574646, "Playa Blanca<br/>Lanzarote<br/>Feb 2006", bigIcon);
            addMarker(48.95165886333004, -0.7091975212097168, "Chateau Walsh<br/>France<br/>Sept 2006", bigIcon, "france2006.jpg");
            addMarker(5.549670446039707, 73.46789360046387, "Kuredu<br/>Maldives<br/>May 2007", bigIcon, "maldives.jpg");
            addMarker(37.024792314236926, -8.96360993385315, "Algarve<br/>Sept 2008", bigIcon, "algarve.jpg");
            addMarker(28.040508501032736, 34.43968176841736, "Sharm el Sheikh<br/>Egypt<br/>Oct 2009", bigIcon, "egypt.jpg");
            addMarker(29.975289962810454, 31.13875687122345, "Cairo<br/>Egypt<br/>Oct 2009", bigGreenIcon, "cairo.jpg");
        }
    }

    //]]>
    </script>
  </head>
  <body onload="doLoad();" onunload="GUnload();">
    <div class="nav">
      <span class="menuButton"><a class="home" href="${createLinkTo(dir:'/')}">Home</a></span>
      <span class="menuButton"><g:link class="list" action="list">Gallery List</g:link></span>
    </div>
    <div>
      <h1>Our World</h1>
    </div>
    <div id="map" style="width:80%; height:550px; margin-left:10%; background-color:#C0C0C0">
      <noscript>
        <div>
          <b>JavaScript must be enabled in order for you to use Google Maps.</b><br/>
          However, it seems JavaScript is either disabled or not supported by your browser.
          To view Google Maps, enable JavaScript by changing your browser options, and then
          try again.<br/><br/>
        </div>
      </noscript>
      <div>
        As Google Maps is not supported by your browser, you will not be able to view the map.
      </div>
    </div>
  </body>
</html>
