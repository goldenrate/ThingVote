function LibOpen(sender)
{
	jQuery(".Libcurrent").removeClass("Libcurrent");

	var senderDiv = jQuery(sender);
	senderDiv.addClass("Libcurrent");
	senderDiv.parent().find("a").addClass("Libcurrent");


	jQuery(".Libloading").hide();
}