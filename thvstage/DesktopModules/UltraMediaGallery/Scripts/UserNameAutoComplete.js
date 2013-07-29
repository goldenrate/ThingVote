/*
 * Auto Complete Script for Ultra Video Gallery 3
 * By Pengcheng Rong (rongers@hotmail.com, service@bizmodules.net)
 * Copyright (c) 2009 Pengcheng Rong
 * All rights reserved, donot use this script library out of Ultra Video Gallery.
*/

function getItemTitleHtml(title)
{
	if (title.indexOf("$")>0)
	{
		return "<table width=100% border=0 cellpadding=0 cellspacing=0><tr><td class='Normal'>" + title.replace("$", "</td><td align=right class=Script>") + "</td></tr></table>"
	}
	return title;
}

function getItemTitlePure(title)
{
	if (title.indexOf("$")>0)
	{
		return title.split("$")[0]
	}
	return title;
}
