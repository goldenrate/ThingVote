/*! Copyright (c) 2010 Brandon Aaron (http://brandonaaron.net)
 * Dual licensed under the MIT (MIT_LICENSE.txt)
 * and GPL Version 2 (GPL_LICENSE.txt) licenses.
 *
 * Version: 1.1.1
 * Requires jQuery 1.3+
 * Docs: http://docs.jquery.com/Plugins/livequery
 */

(function($) {

$.extend($.fn, {
	livequery: function(type, fn, fn2) {
		var self = this, q;

		// Handle different call patterns
		if ($.isFunction(type))
			fn2 = fn, fn = type, type = undefined;

		// See if Live Query already exists
		$.each( $.livequery.queries, function(i, query) {
			if ( self.selector == query.selector && self.context == query.context &&
				type == query.type && (!fn || fn.$lqguid == query.fn.$lqguid) && (!fn2 || fn2.$lqguid == query.fn2.$lqguid) )
					// Found the query, exit the each loop
					return (q = query) && false;
		});

		// Create new Live Query if it wasn't found
		q = q || new $.livequery(this.selector, this.context, type, fn, fn2);

		// Make sure it is running
		q.stopped = false;

		// Run it immediately for the first time
		q.run();

		// Contnue the chain
		return this;
	},

	expire: function(type, fn, fn2) {
		var self = this;

		// Handle different call patterns
		if ($.isFunction(type))
			fn2 = fn, fn = type, type = undefined;

		// Find the Live Query based on arguments and stop it
		$.each( $.livequery.queries, function(i, query) {
			if ( self.selector == query.selector && self.context == query.context &&
				(!type || type == query.type) && (!fn || fn.$lqguid == query.fn.$lqguid) && (!fn2 || fn2.$lqguid == query.fn2.$lqguid) && !this.stopped )
					$.livequery.stop(query.id);
		});

		// Continue the chain
		return this;
	}
});

$.livequery = function(selector, context, type, fn, fn2) {
	this.selector = selector;
	this.context  = context;
	this.type     = type;
	this.fn       = fn;
	this.fn2      = fn2;
	this.elements = [];
	this.stopped  = false;

	// The id is the index of the Live Query in $.livequery.queries
	this.id = $.livequery.queries.push(this)-1;

	// Mark the functions for matching later on
	fn.$lqguid = fn.$lqguid || $.livequery.guid++;
	if (fn2) fn2.$lqguid = fn2.$lqguid || $.livequery.guid++;

	// Return the Live Query
	return this;
};

$.livequery.prototype = {
	stop: function() {
		var query = this;

		if ( this.type )
			// Unbind all bound events
			this.elements.unbind(this.type, this.fn);
		else if (this.fn2)
			// Call the second function for all matched elements
			this.elements.each(function(i, el) {
				query.fn2.apply(el);
			});

		// Clear out matched elements
		this.elements = [];

		// Stop the Live Query from running until restarted
		this.stopped = true;
	},

	run: function() {
		// Short-circuit if stopped
		if ( this.stopped ) return;
		var query = this;

		var oEls = this.elements,
			els  = $(this.selector, this.context),
			nEls = els.not(oEls);

		// Set elements to the latest set of matched elements
		this.elements = els;

		if (this.type) {
			// Bind events to newly matched elements
			nEls.bind(this.type, this.fn);

			// Unbind events to elements no longer matched
			if (oEls.length > 0)
				$.each(oEls, function(i, el) {
					if ( $.inArray(el, els) < 0 )
						$.event.remove(el, query.type, query.fn);
				});
		}
		else {
			// Call the first function for newly matched elements
			nEls.each(function() {
				query.fn.apply(this);
			});

			// Call the second function for elements no longer matched
			if ( this.fn2 && oEls.length > 0 )
				$.each(oEls, function(i, el) {
					if ( $.inArray(el, els) < 0 )
						query.fn2.apply(el);
				});
		}
	}
};

$.extend($.livequery, {
	guid: 0,
	queries: [],
	queue: [],
	running: false,
	timeout: null,

	checkQueue: function() {
		if ( $.livequery.running && $.livequery.queue.length ) {
			var length = $.livequery.queue.length;
			// Run each Live Query currently in the queue
			while ( length-- )
				$.livequery.queries[ $.livequery.queue.shift() ].run();
		}
	},

	pause: function() {
		// Don't run anymore Live Queries until restarted
		$.livequery.running = false;
	},

	play: function() {
		// Restart Live Queries
		$.livequery.running = true;
		// Request a run of the Live Queries
		$.livequery.run();
	},

	registerPlugin: function() {
		$.each( arguments, function(i,n) {
			// Short-circuit if the method doesn't exist
			if (!$.fn[n]) return;

			// Save a reference to the original method
			var old = $.fn[n];

			// Create a new method
			$.fn[n] = function() {
				// Call the original method
				var r = old.apply(this, arguments);

				// Request a run of the Live Queries
				$.livequery.run();

				// Return the original methods result
				return r;
			}
		});
	},

	run: function(id) {
		if (id != undefined) {
			// Put the particular Live Query in the queue if it doesn't already exist
			if ( $.inArray(id, $.livequery.queue) < 0 )
				$.livequery.queue.push( id );
		}
		else
			// Put each Live Query in the queue if it doesn't already exist
			$.each( $.livequery.queries, function(id) {
				if ( $.inArray(id, $.livequery.queue) < 0 )
					$.livequery.queue.push( id );
			});

		// Clear timeout if it already exists
		if ($.livequery.timeout) clearTimeout($.livequery.timeout);
		// Create a timeout to check the queue and actually run the Live Queries
		$.livequery.timeout = setTimeout($.livequery.checkQueue, 20);
	},

	stop: function(id) {
		if (id != undefined)
			// Stop are particular Live Query
			$.livequery.queries[ id ].stop();
		else
			// Stop all Live Queries
			$.each( $.livequery.queries, function(id) {
				$.livequery.queries[ id ].stop();
			});
	}
});

// Register core DOM manipulation methods
$.livequery.registerPlugin('append', 'prepend', 'after', 'before', 'wrap', 'attr', 'removeAttr', 'addClass', 'removeClass', 'toggleClass', 'empty', 'remove', 'html');

// Run Live Queries when the Document is ready
$(function() { $.livequery.play(); });

})(jQuery);


jQuery(document).ready(function(){

	var doubleClickNotified = false;
	var isIOS = false;
	var agt = navigator.userAgent;
	if((agt.match(/iPhone/i)) || (agt.match(/iPod/i)) || (agt.match(/iPad/i))) isIOS = true;
	var useHtml5 = isIOS;
	var modulePath;
	if (typeof(umgpath) != "undefined")
		modulePath = umgpath;
	else
		modulePath = "/DesktopModules/UltraMediaGallery/";

	jQuery(".kenburn-video-button").livequery(function(){
		jQuery(this).click(function(){
			var itemIndex = jQuery(this).parent().parent().index();
			var umgid = jQuery(this).parent().parent().find("p.cp-title").data("umgid");
			var video_video = jQuery("div.video_video[*data-umgid="+umgid+"]");

			video_video.children(".umgmedia").each(function(){
				var mediaURL = jQuery(this).html();
				var mediaType = getMediaType(mediaURL);
				var media = jQuery(this).parent();
				
				if (mediaType == "v")
				{
					var videoTag = "";
					if (!useHtml5)
					{
						var extraParams = "";
						if (!doubleClickNotified)
						{
							doubleClickNotified = true;
							extraParams += "&notification=Double click to watch in full screen.";
						}
						extraParams += "&autoStart=True";
						extraParams += "&showControlBar=True";
						videoTag = "<object allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='100%' height='100%'><param name='movie' value='"+modulePath+"SimpleVideo.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='video="+mediaURL+extraParams+"' /><embed src='"+modulePath+"SimpleVideo.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' allowNetworking='all' width='100%' height='100%' wmode='transparent' flashvars='video="+mediaURL+extraParams+"'></embed></object>";
					}
					else
					{
						var autoStart = "true";
						videoTag = "<video src='" + mediaURL + "' type='video/mp4' width='100%' height='100%' autoplay='"+ autoStart +"' controls='controls' />";
					}

					media.html(videoTag);
				}
				else if (mediaType == "a")
				{
					var audioTag = "";
					if (useHtml5)
					{
						audioTag = "<audio src='" + mediaURL + "' type='audio/mp3' width='100%' height='100%' autoplay='true' controls='controls' />";
					}
					else
					{
						var extraParams = "";
						extraParams += "&showControlBar=True";
						audioTag = "<object allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'><param name='movie' value='"+modulePath+"SimpleAudio.swf' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><param name='flashvars' value='audio="+mediaURL+extraParams+"' /><embed src='"+modulePath+"SimpleAudio.swf' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%' flashvars='audio="+mediaURL+extraParams+"'></embed></object>"
					}

					media.html(audioTag);
				}
				else if (mediaType == "f")
				{
					var flashTag = "";
					if (useHtml5)
					{
						media.html("Flash content is not available on your device.");
						return;
					}
					else
					{
						flashTag = "<object allowFullScreen='True' allowScriptAccess='always' width='100%' height='100%'><param name='movie' value='"+mediaURL+"' /><param name='allowFullScreen' value='true' /><param name='wmode' value='transparent' /><embed src='"+mediaURL+"' type='application/x-shockwave-flash' allowFullScreen='True' allowScriptAccess='always' wmode='transparent' width='100%' height='100%'></embed></object>"
					}

					media.html(flashTag);
				}
			});
		});
	});
});


function getMediaType(filename)
{
	var ext = typeof filename != "undefined" ? filename.substring(filename.lastIndexOf(".")+1, filename.length).toLowerCase() : false;
	if(ext == "mp4" || ext == "flv")
	{
		return "v";
	}
	else if (ext == "mp3")
	{
		return "a";
	}
	else if (ext == "swf")
	{
		return "f";
	}
	else if (ext != "")
	{
		return "i";
	}
	else
	{
		return "";
	}
}
