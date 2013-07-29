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
		return "<div class=Script onclick='return false'>" + title + "</div>"
	}
	return title;
}

function getItemTitlePure(title)
{
	return title;
}
