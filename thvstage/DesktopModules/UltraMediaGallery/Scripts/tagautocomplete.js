var callbackfunction;
function completeTags(sender, callback)
{
	var callbackId = dnn.getVar("meClientId");
	if (!callbackId)
	{
		return;
	}
	callbackfunction = callback;
	dnn.xmlhttp.doCallBack(callbackId,"SEARCHTAG:"+sender.term,completeTags_Callback,this,null,null,false,null,0);
}
function completeTags_Callback(result, ctx)
{
	var tags = jQuery.parseJSON(result);
	callbackfunction (tags);
}