var itemContainer;

function showBulkLightBox(stringArray)
{
	showBulkLightBox2("", stringArray, 0);
}

function showBulkLightBox2(basePath, stringArray, index)
{
	if (!itemContainer)
	{
		itemContainer = document.createElement("div");
		itemContainer.style.display = "none";
		itemContainer.id = "itemContainer";
		document.body.appendChild(itemContainer);
	}

	if (!index)
	{
		index = 0;
	}

	var itemHtml = "";
	var photos = stringArray.split("[T]");
	var j=0;
	for (var i=0;i<photos.length;i++)
	{
		var meta = photos[i].split("[U]");
		var title = meta[0];
		var path = meta[1];

		if (path != undefined)
		{
			itemHtml += "<a class='thickbox' href='";
			var prefix = path.substring(0,7).toLowerCase();
			if (prefix != "http://" && prefix != "https:/")
			{
				itemHtml += basePath;
			}
			itemHtml += path + "' title='" + title + "' rel='calendar'";
			if (index == j) 
			{
				itemHtml += " id='thickdefaultItem'";
			}
			itemHtml += "></a>";
			j++;
		}
	}

	itemContainer.innerHTML = itemHtml;
	tb_init('a.thickbox');

	//tb_show(firstTitle, firstPath, "calendar");
	var defaultItem = document.getElementById("thickdefaultItem");

	if(document.all)
	{
		defaultItem.click();
	}
	else
	{
		var evt = document.createEvent("MouseEvents");
		evt.initEvent("click", true, true);
		defaultItem.dispatchEvent(evt);
	} 
}