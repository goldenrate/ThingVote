var itemIndex;
var itemId;
var itemContainer;
var itemImage;
var itemTitle;
var itemDesc;
var itemTag;

function ensureItemContainer()
{
	if (!itemContainer)
	{
		itemContainer = document.createElement("div");
		itemContainer.style.display = "none";
		itemContainer.id = "itemContainer";
		document.body.appendChild(itemContainer);
	}
}

function quickEdit(index)
{
	itemIndex = index;
	itemId = document.getElementById("itemId" + index).innerHTML * 1;
	itemImage = document.getElementById("itemImage" + index);
	itemTitle = document.getElementById("itemTitle" + index);
	itemDesc = document.getElementById("itemDesc" + index);
	itemTag = document.getElementById("itemTag" + index);

	var title = itemTitle.innerHTML.trim();

	ensureItemContainer();
	var editHtml;
	editHtml = "<table cellpadding='3' width='100%'>";
	editHtml += "<tr><td colspan='2' align='center'><table width='100%'><td width='60'>";
	if (document.getElementById("itemTitle" + (index - 1)))
	{
		editHtml += "<img alt='save & load previous' src='" + uvgPath + "images/previous.png' style='cursor:pointer;' onclick='move(-1);'>";
	}
	editHtml += "</td><td align='center'>" + itemImage.innerHTML + "</td><td width='60' align='right'>";
	if (document.getElementById("itemTitle" + (index + 1)))
	{
		editHtml += "<img alt='save & load next' src='" + uvgPath + "images/next.png' style='cursor:pointer;' onclick='move(1);'>";
	}
	editHtml += "</td></table></td></tr>";
	editHtml += "<tr><td class='SubSubHead' width='100'>Title:</td><td><input id='itemTitleNew' type='text' class='NormalTextBox' style='width:300px' value='" + title + "'></td></tr>";
	editHtml += "<tr><td class='SubSubHead'>Description:</td><td><textarea id='itemDescNew' class='NormalTextBox' style='width:300px' rows='4'>" + itemDesc.innerHTML.trim() + "</textarea></td></tr>";
	if (itemTag)
	{
		editHtml += "<tr><td class='SubSubHead'>Tags:</td><td><input id='itemTagNew' type='text' class='NormalTextBox' style='width:300px' value='" + itemTag.innerHTML.trim() + "'></td></tr>";
	}
	editHtml += "<tr><td colspan='2' align='center'><input type='button' class='CommandButton' value='Update' onclick='saveAndClose();'> <input type='button' class='CommandButton' value='Cancel' onclick='tb_remove();'></td></tr>";
	editHtml += "</table>";
	itemContainer.innerHTML = editHtml;

	tb_show("Edit '" + title + "'", "#TB_inline?height=300&width=420&inlineId=" + itemContainer.id, null);
}

function quickSave()
{
	var itemTitleNew = document.getElementById("itemTitleNew");
	var itemDescNew = document.getElementById("itemDescNew");
	var itemTagNew = document.getElementById("itemTagNew");

	var changed = false;
	if (itemTitle.innerHTML.trim() != itemTitleNew.value.trim())
	{
		changed = true;
		itemTitle.innerHTML = itemTitleNew.value.trim();
	}

	if (itemDesc.innerHTML.trim() != itemDescNew.value.trim())
	{
		changed = true;
		itemDesc.innerHTML = itemDescNew.value.trim();
	}

	if (itemTagNew)
	{
		if (itemTag.innerHTML.trim() != itemTagNew.value.trim())
		{
			changed = true;
			itemTag.innerHTML = itemTagNew.value.trim();
		}
		if (changed)
		{
			saveItem(itemId, itemTitleNew.value, itemDescNew.value, itemTagNew.value);
			itemTitle.style.color = "#FF0000";
		}
	}
	else
		if (changed)
		{
			saveItem(itemId, itemTitleNew.value, itemDescNew.value);
			itemTitle.style.color = "#FF0000";
		}
}

function saveAndClose()
{
	quickSave();

	tb_remove();
}

function move(offset)
{
	quickSave();

	document.getElementById("TB_ajaxContent").innerHTML = "";

	quickEdit(itemIndex + offset);

	document.getElementById("TB_ajaxWindowTitle").innerHTML = "<span class='Head'>" +document.getElementById("TB_ajaxWindowTitle").innerHTML + "</span>";
}
