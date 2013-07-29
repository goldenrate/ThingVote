jQuery(document).ready(function(){
	jQuery(".pg_photos a").click(function(){
		jQuery(".choosed").remove();
		var choosed = jQuery("<div class='choosed'><div class='done'></div></div>");
		jQuery(this).append(choosed);

		jQuery(".presentationid").val(jQuery(this).data("umgid"));
	});

	if (jQuery(".presentationid").val() * 1 > 0)
	{
		var presentationid = jQuery(".presentationid").val() * 1;
		if (presentationid > 0)
		{
			jQuery(".pg_photos a[data-umgid="+presentationid+"]").trigger("click");
		}
	}
});