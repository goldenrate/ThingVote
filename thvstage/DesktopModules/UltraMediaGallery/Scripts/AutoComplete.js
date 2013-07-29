/*
 * Auto Complete Script for Ultra Video Gallery 3
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2009 Pengcheng Rong
 * All rights reserved, donot use this script library out of Ultra Video Gallery.
*/

var textField;
var extender;
var white = "#ffffff";
var blue = "#316ac5"
var previousPrefix = "";
var activeItem;
var series;

function autoComplete(sender)
{
	autoCompleteEX(sender, null);
}
function autoCompleteEX(sender, additionalParam)
{
	textField = sender;
	var prefix = textField.value;
	if (prefix.length < 2)
	{
		hideExtender();
		return;
	}
	if (previousPrefix == prefix)
	{
		return;
	}
	if (additionalParam)
		prefix += additionalParam
	previousPrefix = prefix;
	dnn.setVar("selectedItem", "");
	dnn.xmlhttp.doCallBack(dnn.getVar("meClientId"),prefix,autoComplete_Callback,this,autoComplete_CallbackFailed,null,null,null,0);
}
function autoComplete_CallbackFailed(result, ctx)
{
	alert(result);
}
function autoComplete_Callback(result, ctx)
{
	var extenderExisted = false;
	if (extender)
	{
		if (extender.parentNode)
		{
			extenderExisted = true;
		}
	}
	if (!extenderExisted)
	{
		extender = document.createElement("div");
		textField.parentNode.appendChild(extender);
		extender.style.position = "absolute";
		extender.style.float = "left";
		extender.style.border = "1px solid #000000";
		extender.style.width = textField.offsetWidth;
		var xOffset;
		if (window.event+"" != 'undefined')
		{
			xOffset = textField.offsetHeight.toString();
		}
		else
		{
			xOffset = "0";
		}
		var margin = xOffset + " 0 0 -" + (extender.offsetLeft - GetAbsoluteLocationEx(textField).absoluteLeft).toString() + "px";
		extender.style.margin = margin;
		extender.style.display = "none";
	}

	var inner = "<table width=100% border=0 cellpadding=1 cellspacing=0>";
	if (result!= "" && result!= null)
		series = result.split("|");
	else
		series = new Array();

	if (series.length > 0)
	{
		for (var i=0;i<series.length ;i++ )
		{
			var seriesInfo = series[i].split("%");
			var seriesTitle = seriesInfo[0];
			var seriesTitleHtml;
			var seriesTitlePure;
			if (typeof(getItemTitleHtml) == "function")
			{
				seriesTitleHtml = getItemTitleHtml(seriesTitle);
				seriesTitlePure = getItemTitlePure(seriesTitle);
			}
			else
			{
				seriesTitleHtml = seriesTitle;
				seriesTitlePure = seriesTitle;
			}
			if (seriesTitlePure.indexOf("'") >= 0)
			{
				seriesTitlePure = seriesTitlePure.replace("'", "\\'");
			}
			var seriesId = seriesInfo[1];
			inner += "<tr><td style=\"padding-left:4px;background-color:"+white+"\" onmouseover=\"itemOver(this)\" onmouseout=\"itemOut(this)\" onclick=\"selectSeries('" + seriesTitlePure + "'," + seriesId + ")\" class=\"Normal\">";
			inner += seriesTitleHtml;
			inner += "</td></tr>";
		}
	}
	else
	{
			inner += "<tr><td style=\"padding-left:4px;background-color:"+white+"\" onmouseover=\"itemOver(this)\" onmouseout=\"itemOut(this)\" onclick=\"hideExtender()\" class=\"Normal\">";
			inner += dnn.getVar("itemNotFound");
			inner += "</td></tr>";
	}

	inner += "</table>"		
	extender.innerHTML = inner;
	showExtender();
}
function itemOver(sender)
{
	if (activeItem)
	{
		activeItem.style.backgroundColor = white;
		activeItem = null;
	}
	sender.style.backgroundColor = blue;
	activeItem = sender;
}
function itemOut(sender)
{
	sender.style.backgroundColor = white;
}
function selectSeries(text, value)
{
	if (value)
	{
		textField.value = text;
		dnn.setVar("selectedItem", value);
	}
	hideExtender();
}
function showExtender()
{
	if (extender.style.display != "none")
	{
		return;
	}
	extender.style.display = "";
	addEvent(document.body, "mouseup", hideExtender);
	addEvent(document.body, "keydown", keynavExtender);
}
function hideExtender()
{
	if (!extender)
	{
		return;
	}
	if (extender.style.display == "none")
	{
		return;
	}
	extender.style.display = "none";
}
function keynavExtender(evt)
{
	var keyCode;
	if(window.event)
		keyCode = event.keyCode;
	else if(evt.which)
		keyCode = evt.which;
 
	var tbl = extender.childNodes[0];
	if(keyCode == 40)
	{
		//move down
		for (var i=0;i<tbl.childNodes[0].childNodes.length ;i++ )
		{
			if (tbl.childNodes[0].childNodes[i].childNodes[0] == activeItem)
			{
				if (i<tbl.childNodes[0].childNodes.length-1)
				{
					tbl.childNodes[0].childNodes[i].childNodes[0].style.backgroundColor = white;
					tbl.childNodes[0].childNodes[i+1].childNodes[0].style.backgroundColor = blue;
					activeItem = tbl.childNodes[0].childNodes[i+1].childNodes[0];
				}
				return false;
			}
		}
		tbl.childNodes[0].childNodes[0].childNodes[0].style.backgroundColor = blue;
		activeItem = tbl.childNodes[0].childNodes[0].childNodes[0];
		return false;
	}
	else if (keyCode == 38)
	{
		//move up
		var tbl = extender.childNodes[0];
		for (var i=0;i<tbl.childNodes[0].childNodes.length ;i++ )
		{
			if (tbl.childNodes[0].childNodes[i].childNodes[0] == activeItem)
			{
				if (i>0)
				{
					tbl.childNodes[0].childNodes[i].childNodes[0].style.backgroundColor = white;
					tbl.childNodes[0].childNodes[i-1].childNodes[0].style.backgroundColor = blue;
					activeItem = tbl.childNodes[0].childNodes[i-1].childNodes[0];
				}
				return false;
			}
		}
		tbl.childNodes[0].childNodes[0].childNodes[0].style.backgroundColor = blue;
		activeItem = tbl.childNodes[0].childNodes[0].childNodes[0];
		return false;
	}
	else if (keyCode == 13)
	{
		//enter
		for (var i=0;i<tbl.childNodes[0].childNodes.length ;i++ )
		{
			if (tbl.childNodes[0].childNodes[i].childNodes[0] == activeItem)
			{
				if (series.length == 0)
				{
					hideExtender();
				}
				else
				{
					var seriesInfo = series[i].split("%");
					var seriesId = seriesInfo[1];
					var seriesTitle = seriesInfo[0];
					var seriesTitlePure = seriesTitle;
					if (typeof(getItemTitlePure) == "function")
						seriesTitlePure = getItemTitlePure(seriesTitle);

					previousPrefix = seriesTitlePure; // manually change previousPrefox so listSeries function stops working
					selectSeries(seriesTitlePure, seriesId);
				}
				if(evt.which) evt.preventDefault();
				return false;
			}
		}
	}
}

//Utilites
function addEvent(obj, evType, fn)
{
	if (obj.addEventListener)
	{
		obj.addEventListener(evType, fn, false);
		return true;
	}
	else if (obj.attachEvent)
	{
		var r = obj.attachEvent("on"+evType, fn);
		return r;
	}
	else
	{
		alert("Handler could not be attached");
	}
}
function GetAbsoluteLocationEx(element) 
{ 
    if ( arguments.length != 1 || element == null ) 
    { 
        return null; 
    } 
    var elmt = element; 
    var offsetTop = elmt.offsetTop; 
    var offsetLeft = elmt.offsetLeft; 
    var offsetWidth = elmt.offsetWidth; 
    var offsetHeight = elmt.offsetHeight; 
    while( elmt = elmt.offsetParent ) 
    { 
          // add this judge 
        if ( elmt.style.position == 'absolute' || elmt.style.position == 'relative'  
            || ( elmt.style.overflow != 'visible' && elmt.style.overflow != '' ) ) 
        { 
            break; 
        }  
        offsetTop += elmt.offsetTop; 
        offsetLeft += elmt.offsetLeft; 
    } 
    return { absoluteTop: offsetTop, absoluteLeft: offsetLeft, 
        offsetWidth: offsetWidth, offsetHeight: offsetHeight }; 
} 

/*function getInnerText(obj)
{
  return document.all?obj.innerText:obj.textContent;
}*/