<%@ Control Language="vb" AutoEventWireup="false" Codebehind="Map.ascx.vb" Inherits="BizModules.UltraPhotoGallery.Map" %>
<script type="text/javascript">
UPG_listen("showMap");

var defaultZoom = 3;
var map;
var marker;
var incraseZInterval;
var point;
var isEditable = <%=EditMode.ToString.ToLower()%>;
var hasGPS;
var currentThumb = "";
var tookConfirmed = false;
    
function showMap()
{
	if (!map) initialize();
    if (marker)
		map.removeOverlay(marker);
    
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>','load|'+currentPhotoId,showMap_CallBack,this,showMap_CallBackError,null,null,null,0);
}

function showMap_CallBack(result, ctx)
{
    if (marker)
		map.removeOverlay(marker);

	var mapData = result.split("|");
    var lat = mapData[0] * 1;
    var lng = mapData[1] * 1;
    var thumb = mapData[2];
    var title = mapData[3];
    
    currentThumb = "<img src='"+thumb+"' align='left' />";
    
    if (lat == 0 && lng == 0)
    {
        //no gps coordinate
        hasGPS = false;
        return;
    }
    else
    {
        hasGPS = true;
    }

	point = new GLatLng(lat, lng);
	marker = new GMarker(point);
	map.addOverlay(marker);
	map.panTo(point);
	marker.openInfoWindowHtml(currentThumb + title);
	
	//Save to cookie everytime it move to a new position
	setCookie("latlng", point);
	
	if (map.getZoom() == defaultZoom)
	{
	    //still using the default zoom level, let's enlarge it.
	    incraseZInterval = window.setInterval(increaseZIndex, 1000);
	}
	else
	{
	    //user already changed to zoom level, so we keep it like this
	    //setCookie("zindex", map.getZoom());
	}
}

function increaseZIndex()
{
    if (map.getZoom() == 12)
    {
        window.clearInterval(incraseZInterval);
        //map.panTo(point);
        return;
    }
    
    map.setZoom(map.getZoom() + 1);
}

function showMap_CallBackError(result, ctx)
{
}

function initialize() {
  if (GBrowserIsCompatible()) {
      var mapOptions = {
        googleBarOptions : {
          style : "new"
        }
      }
    map = new GMap2(document.getElementById("map_canvas"), mapOptions);
    var zoomendTimes = 0;
    GEvent.addListener(map, "zoomend", function() {
        zoomendTimes += 1;
        if (zoomendTimes == 1) return;
        setCookie("zindex", map.getZoom());
    });

	var latlng_cookie = getCookie("latlng");
	var zindex = getCookie("zindex");
	if (!zindex) 
		zindex = defaultZoom;
	else
		zindex *= 1;

	if (latlng_cookie)
	{
		var center = new GLatLng(getLatitude(latlng_cookie), getLongitude(latlng_cookie));
		map.setCenter(center, zindex);
	}
	else
	{
		var center = new GLatLng(40, -95);
		map.setCenter(center, zindex);
	}

    map.setUIToDefault();


    //isEditable
    /*var optMode_1 = document.getElementById("IconBar.ascx_optMode_1") || document.getElementById("dnn_IconBar.ascx_optMode_1") ;
    if (!optMode_1)
        isEditable = false;
    else
        isEditable = optMode_1.checked;
	var action = document.getElementById("dnn_ctr<%=ModuleId%>_dnnACTIONS_ctldnnACTIONS")||document.getElementById("dnn_ctr<%=ModuleId%>_dnnSOLPARTACTIONS_ctldnnSOLPARTACTIONS");
	if (action) isEditable = true;*/        
        
    if (isEditable)
    {
        //page in edit mode, allow this user to manually set the gps coordinate
		map.enableGoogleBar();
        GEvent.addListener(map,"click", function(overlay,latlng) {
            if (hasGPS || !currentPhotoId) return; // current photo already have gps data, so you cann't mark it.
            
            if(overlay)
            {
	            return false;
            }
            
		    if (marker)
			    map.removeOverlay(marker);

            marker = new GMarker(latlng, {draggable: true});
            map.addOverlay(marker);
            marker.openInfoWindowHtml(currentThumb + "<p class='Normal'>" + formatLatitude(latlng.y) + ", " + formatLongitude(latlng.x) + "</p><p><input class='Normal' type='button' value='<%=Localize("TakenHere") %>' onclick='tookHere("+latlng.y+","+latlng.x+")' /></p>");

            GEvent.addListener(marker, "dragend", function() {
                marker.openInfoWindowHtml(currentThumb + "<p class='Normal'>" + formatLatitude(marker.getPoint().y) + ", " + formatLongitude(marker.getPoint().x) + "</p><p class='Normal'><input type='button' value='<%=Localize("TakenHere") %>' onclick='tookHere("+marker.getPoint().y+","+marker.getPoint().x+")' /></p>");
            //marker.openInfoWindowHtml("" + marker.getPoint());
	            //document.getElementById("marker_location").innerText = map.fromLatLngToDivPixel(marker.getPoint());
		    });
        });
	 }
  }
}

function tookHere(lat, lng)
{
    if (!tookConfirmed)
    {
        if (!window.confirm("<%=Localize("TookConfirm") %>"))
        {
            return;
        }
        tookConfirmed = true;
    }
    dnn.xmlhttp.doCallBack('<%=Me.ID%> <%=Me.ClientID%>','mark|'+currentPhotoId+"|"+lat+"|"+lng,showMap_CallBack,this,showMap_CallBackError,null,null,null,0);
}

function getLatitude(point)
{
	return point.substring(1, point.indexOf(","));
}
function getLongitude(point)
{
	return point.substring(point.indexOf(",") + 2, point.length - 1);
}
function formatLatitude(lat)
{
    return Math.round(Math.abs(lat) * 10000) / 10000 + " " + (lat > 0?"N":"S");
}
function formatLongitude(lng)
{
    return Math.round(Math.abs(lng) * 10000) / 10000 + " " + (lng > 0?"E":"W");
}

function setCookie(name,value)
{
	var Days = 90; //keep for 90 days
	var exp  = new Date();    //new Date("December 31, 9998");
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
function getCookie(name)
{
	var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
	 if(arr != null) return unescape(arr[2]); return null;
}
function deleteCookie(name)
{
	var exp = new Date();
	exp.setTime(exp.getTime() - 1);
	var cval=getCookie(name);
	if(cval!=null) document.cookie= name + "="+cval+";expires="+exp.toGMTString();
}

	//setCookie("latlng", point);
	//setCookie("zindex", zoom);

	addEvent(window,"load" , initialize);
	addEvent(window,"unload" , GUnload);
</script>

    <div id="map_canvas" style="width: <%=IIf(ModuleSetting("Width")="", "600", ModuleSetting("Width")) %>px; height: <%=IIf(ModuleSetting("Height")="", "420", ModuleSetting("Height")) %>px">
    </div>