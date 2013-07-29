var currentPhotoId;
var listening = new Array();

function UPG_onPhotoLoad(id)
{
	currentPhotoId = id;
	
	for (var i=0;i<listening.length ;i++ )
	{
		var func = listening[i] + "();";
		eval (func);
	}
}

function UPG_listen(func)
{
	listening.push(func);
}