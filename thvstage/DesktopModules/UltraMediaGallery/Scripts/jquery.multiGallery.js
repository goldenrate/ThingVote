
	
(function($) {

	$.multiGallery = function (wrapper, settings) {
		
	
	
		
	//SETTINGS
	var componentInited = false;
	
	var componentWrapper = $(wrapper);
	var componentPlaylist = componentWrapper.find('.componentPlaylist');
	//console.log(componentWrapper, componentPlaylist);
	
	//show preloader
	var usePreloader=settings.usePreloader;
	if(usePreloader){
		var componentPreloader=componentWrapper.find('.componentPreloader');
		componentPreloader.css('zIndex', 104);
		showPreloader();
	}else{
		componentWrapper.find('.componentPreloader').remove();
	}
	
	var playlistIndex=settings.playlistIndex;
	var playlistSize;
	if(playlistIndex != 'inside') playlistSize=settings.playlistSize;
	
	var _body = $('body');
	var _window = $(window);
	var _doc = $(document);
	/*
	var isIE7=false;
	if ($.browser.msie && parseInt($.browser.version, 10) === 7) {
	  isIE7=true;
	  //console.log(isIE7);
	}*/
	
	var _thumbClick=false;//if random play, on thumb click set counter to cliked thumb
	var fixMenu=settings.fixMenu;
	if(fixMenu){
		var fixMenuSide = settings.fixMenuSettings.side;
		var fixMenuValue = settings.fixMenuSettings.value;
	} 
	var fixThumbs=settings.fixThumbs;
	if(fixThumbs){
		var fixThumbsSide = settings.fixThumbsSettings.side;
		var fixThumbsValue = settings.fixThumbsSettings.value;
	} 
	
	var disableRightClick = settings.disableRightClick;
	
	var componentFixedSize=settings.componentFixedSize;
	
	var _componentWidth= parseInt( componentWrapper.css('width'), 10);
	var _componentHeight= parseInt( componentWrapper.css('height'), 10);
	
	var playlistPosition = settings.playlistPosition;
	var thumbOrientatation;
	var menuOrientatation;
	if(playlistPosition == 'top' || playlistPosition=='bottom'){
		thumbOrientatation = 'horizontal';
		menuOrientatation = 'horizontal';
		if(playlistIndex != 'inside'){
			_componentWidth = parseInt( componentWrapper.css('width'), 10);
			_componentHeight = parseInt( componentWrapper.css('height'), 10)-playlistSize;
		}
	}else if(playlistPosition == 'left' || playlistPosition=='right'){
		thumbOrientatation = 'vertical';
		menuOrientatation = 'vertical';
		if(playlistIndex != 'inside'){
			_componentWidth = parseInt( componentWrapper.css('width'), 10)-playlistSize;
			_componentHeight = parseInt( componentWrapper.css('height'), 10);
		}
	}
	
	var dataArr = componentPlaylist.children('div[data-categoryTitle]');//category data
	var categoryDataArr=[];//data per category
	var currentData;//data per category
	var maxDescriptionWidth=settings.maxDescriptionWidth;
	
	var _categoryLength = dataArr.size();
	var singleCategory = false;
	if(_categoryLength==1) singleCategory = true;
	var _playlistLength;
	var playlistOpened=false;
	var autoOpenPlaylist = settings.autoOpenPlaylist;
	
	var windowResizeInterval = 30;//execute resize after time finish
	
	var _kenBurnsPositions = ['tl','tc','tr','ml','mc','mr','bl','bc','br'];
	var kbEndPosition;//var for resize math in ken burns window resize if transition off
	var lastComponentW;
	var kenBurnsTransitionOn=false;//allow media change while ken burns executes
	
	var _slideCaseArr = [ "top", "left", "bottom", "right" ];
	var _slideCase;
	
	var _revealCaseArr = [ "top", "left", "bottom", "right" ];
	var _revealCase;
	
	var _splitCaseArr = ['horizontalUpLeft' , 'horizontalUpRight', 'horizontalSplit', "verticalUpLeft", "verticalDownLeft", "verticalSplit"];
	var _splitCase;
	
	var _firstImageTime = 500;
	var _firstImageEase = 'easeOutSine';
	
	var _counter=-1;
	var categoryTransitionOn=false;
	var categoryIntroHappened=false;
	
	var slideshowOn = settings.slideshowOn;
	var slideshowTimeout = settings.slideshowDelay;
	var slideshowTimeoutID; 
	var useGlobalDelay = settings.useGlobalDelay;
	
	var loadRequestInterval = 100;//request new load while one is performing
	var loadRequestIntervalID; 
	var _mediaLoadOn=false;
	var loadRequestPause=false;//prevent queue load for request load
	
	var transitionEase;//image transition settings
	var transitionTime;
	var transitionOn=false;//image transition on
	var lastActiveThumb = null;//thumb disabling 
	var thumbItemArr=[];//holds div thumbanils
	
	var linkExist=false;
	var _link;
	var _target;
	
	//create holders for loaded media
	var mediaObj = {};
	var obj;
	var mainArr;
	var thumbArr=[];
	var categoryTitleArr=[];
	var i = 0;
	for(i; i < _categoryLength; i++){
		obj = {};
		mainArr = [];
		obj.mainLoaded=false;
		obj.main=mainArr;
		mediaObj[i] = obj;
		categoryTitleArr[i] = $(dataArr[i]).attr('data-categoryTitle');
	}
	//console.log(categoryTitleArr);
	
	var _categoryMainLoaded=false;
	var _allMediaLoaded=false;
	
	var _randomArr = [];
	var _randomPlay = settings.randomPlay;
	
	var navigationActive=false;
	
	var slideshowAdvancesToNextCategory = settings.slideshowAdvancesToNextCategory;
	var transitionIntroHappened = false;//first image loaded in category
	
	var makeImageClickableForUrl=settings.makeImageClickableForUrl;
	
	var queMediaRequest=false;
	var queMediaRequestID;
	
	var queCategoryRequest=false;
	var queCategoryRequestID;
	
	var _transitionType;		
	var forceImageFitMode=settings.forceImageFitMode;//force fit even if smaller
	var imageFitMode=false;
	var componentBgColor;
	var activeCategory=settings.activeCategory;
	if(singleCategory) activeCategory = 0;
	else if(activeCategory > _categoryLength-1) activeCategory = _categoryLength-1;	
	
	var componentHolder = $("<div/>");
	componentHolder.css('position', 'absolute');
	componentHolder.css('top', 0);
	componentHolder.css('left', 0);
	componentHolder.css('width', _componentWidth + 'px');
	componentHolder.css('height', _componentHeight + 'px');
	componentHolder.css('overflow', 'hidden');
	componentWrapper.append(componentHolder);
	
	//holders for transitions		
	var _holder1 = $("<div/>");
	_holder1.css('display', 'none');
	_holder1.attr('data-title', '_holder1');
	_holder1.css('position', 'absolute');
	_holder1.css('zIndex', 0);
	componentHolder.append(_holder1);
	
	var _holder2 = $("<div/>");
	_holder2.attr('data-title', '_holder2');
	_holder2.css('display', 'none');
	_holder2.css('position', 'absolute');
	_holder2.css('zIndex', 1);
	componentHolder.append(_holder2);
	
	//playlist vars
	var thumbBorderRadius=settings.thumbBorderRadius;
	
	var menuBeforeSpace=settings.menuBeforeSpace;
	var menuSize=0;//only once
	var menuThumbSpace=settings.menuThumbSpace;
	var thumbSize=0;//changes per category
	var thumbAfterSpace=settings.thumbAfterSpace;
	
	var playlistTransitionOn=false;
	var visibleThumbs = settings.visibleThumbs;
	var maxVisibleThumbs = false;
	if(visibleThumbs == 'max') {
		maxVisibleThumbs = true;
		fixThumbs=false;
	}
	var thumbSpacing = settings.thumbSpacing;
	var thumbWidth;
	var thumbHeight;
	var playlistBgColor = settings.playlistBgColor;
	var thumbRolloverSize = settings.thumbRolloverSize;
	var thumbBtnOffset =settings.thumbBtnOffset;
	var currentlyVisibleThumbs;
	var thumbBtnBuffer = 100 + 2 * thumbBtnOffset;
	var minPlaylistSize;
	var thumbHolderSize;
	var thumbPositionArr = [];//save positions
	var minVisibleThumbs;
	var playlistCounter=0;
	if(thumbOrientatation=='horizontal'){
		minPlaylistSize=600-thumbBtnBuffer;
		minVisibleThumbs = Math.floor(minPlaylistSize / (thumbWidth + thumbSpacing));
	}else{
		minPlaylistSize=450-thumbBtnBuffer;
		minVisibleThumbs = Math.floor(minPlaylistSize / (thumbHeight + thumbSpacing));
	}
	//console.log('minVisibleThumbs = ', minVisibleThumbs);
	var playlistHolder;
	var _thumbHolder;
	var thumbWrapper;
	var prevThumbBtn;
	var nextThumbBtn;
	var thumbRollover;
	
	
	
	
	//menu vars
	var minVisibleMenuItems = 1;//we will hardcode this and start from there up. Displaying menu without that wouldnt be possible anyway.
	var currentlyVisibleMenuItems=0;
	var menuSpacing = settings.menuSpacing;
	var visibleMenuItems = settings.visibleMenuItems;
	var maxVisibleMenuItems = false;
	if(visibleMenuItems == 'max') {
		maxVisibleMenuItems = true;
		fixMenu=false;
	}
	var menuBtnOffset =settings.menuBtnOffset;
	var menuCounter = activeCategory;
	var menuTransitionOn=false;
	var menuItemArr=[];
	var menuItemSizeArr = [];//save sizes
	var menuItemSizeArr2 = [];//for vertical menu
	var menuItemPositionArr = [];//save positions
	var _menuHolder;
	var menuWrapper;
	var menuBtnBuffer = 100 + 2 * menuBtnOffset;
	var prevMenuBtn;
	var nextMenuBtn;
	var menuHolderSize=0;
	var maxMenuItemWidth = 0;
	var maxMenuItemHeight = 0;
	var menuRollover;
	var startItem;//menu counter for left dir addition
	var menuRolloverLRSize = settings.menuRolloverLRSize;
	var menuRolloverTBSize = settings.menuRolloverTBSize;
	var menuRolloverBorderRadius;
	var menuBtnPosOffset=settings.menuBtnPosOffset;
	var lastActiveMenuItem = null;//menu disabling 
	
	
	//************************* SLIDESHOW CONTROLS, INFO, DESCRIPTION ***********************//
	
	var useSlideshowControls=settings.useSlideshowControls;
	if(useSlideshowControls){
		var slideshow_controls = componentWrapper.find('.slideshow_controls');
		slideshow_controls.css('zIndex', 100);
		var controls_prev = componentWrapper.find('.controls_prev');
		var controls_toggle = componentWrapper.find('.controls_toggle');
		var controls_next = componentWrapper.find('.controls_next');
		
		controls_prev.css('cursor', 'pointer');
		controls_toggle.css('cursor', 'pointer');
		controls_next.css('cursor', 'pointer');
		
		controls_prev.bind('click', clickControls);
		controls_toggle.bind('click', clickControls);
		controls_next.bind('click', clickControls);
		
		controls_prev.bind('mouseover', overControls);
		controls_toggle.bind('mouseover', overControls);
		controls_next.bind('mouseover', overControls);
		
		controls_prev.bind('mouseout', outControls);
		controls_toggle.bind('mouseout', outControls);
		controls_next.bind('mouseout', outControls);
		
		var controlsPrevSrc=controls_prev.children('img');
		var controlsNextSrc=controls_next.children('img');
		var controlsToggleSrc=controls_toggle.children('img');
		
		if(slideshowOn) controlsToggleSrc.attr('src', settings.iconPath + 'pause_off.png');
		
		//fade in controls
		slideshow_controls.css('opacity', 0);
		slideshow_controls.css('display', 'block');
		slideshow_controls.stop().animate({ 'opacity': 1},  {duration: 1000, easing: 'easeOutSine'});
	}else{
		componentWrapper.find('.slideshow_controls').remove();
	}
	
	
	//INFO
	var data_controls = componentWrapper.find('.data_controls');
	data_controls.css('zIndex', 103);
	
	var useDescription = settings.useDescription;
	if(useDescription){
		var autoOpenDescription=settings.autoOpenDescription;
		var infoOpened=false;
		var infoExist=false;
		var infoData;
		var info_toggle = componentWrapper.find('.info_toggle');
		
		info_toggle.css('cursor', 'pointer');
		
		info_toggle.bind('click', clickControls);
		info_toggle.bind('mouseover', overControls);
		info_toggle.bind('mouseout', outControls);
		
		var infoToggleSrc=info_toggle.children('img');
		
		var infoHolder = componentWrapper.find('.info_holder');
		infoHolder.css('zIndex', 102);
		
	}else{
		componentWrapper.find('.info_toggle').remove();
		componentWrapper.find('.info_holder').remove();
	}
	
	//LINK
	var link_toggle = componentWrapper.find('.link_toggle');
	link_toggle.css('cursor', 'pointer');
	link_toggle.bind('click', clickControls);
	link_toggle.bind('mouseover', overControls);
	link_toggle.bind('mouseout', outControls);
	var linkToggleSrc=link_toggle.children('img');
	
	var fixPlaylistToggleBtn=settings.fixPlaylistToggleBtn;
	//PLAYLIST TOGGLE
	if(playlistIndex == 'inside'){
		var playlist_toggle = componentWrapper.find('.playlist_toggle');
		playlist_toggle.css('zIndex', 104);
		playlist_toggle.css('cursor', 'pointer');
		playlist_toggle.bind('click', clickControls);
		playlist_toggle.bind('mouseover', overControls);
		playlist_toggle.bind('mouseout', outControls);
		var playlistToggleSrc=playlist_toggle.children('img');
		playlist_toggle.css('opacity', 0);
		playlist_toggle.css('display', 'block');
		playlist_toggle.stop().animate({ 'opacity': 1},  {duration: 1000, easing: 'easeOutSine'});
	}else{
		componentWrapper.find('.playlist_toggle').remove();
	}
	
	//wrapper for thumbs
	thumbWrapper = $("<div/>");
	thumbWrapper.css('position', 'absolute');
	
	var loadContent=[];
	loadStuff();
	
	function loadStuff(){
		var prevMenuBtnUrl,nextMenuBtnUrl,prevThumbBtnUrl,nextThumbBtnUrl;
		
		if(playlistPosition == 'top' || playlistPosition=='bottom'){
			prevMenuBtnUrl=settings.iconPath + 'playlist_prev_h.png';
			nextMenuBtnUrl=settings.iconPath + 'playlist_next_h.png';
			prevThumbBtnUrl=settings.iconPath + 'playlist_prev_h.png';
			nextThumbBtnUrl=settings.iconPath + 'playlist_next_h.png';
		}else if(playlistPosition == 'left' || playlistPosition=='right'){
			prevMenuBtnUrl=settings.iconPath + 'playlist_prev_v.png';
			nextMenuBtnUrl=settings.iconPath + 'playlist_next_v.png';
			prevThumbBtnUrl=settings.iconPath + 'playlist_prev_v.png';
			nextThumbBtnUrl=settings.iconPath + 'playlist_next_v.png';
		}
		var i = 0;
		var contentUrl=[prevThumbBtnUrl, nextThumbBtnUrl, prevMenuBtnUrl, nextMenuBtnUrl];
		var len = contentUrl.length;
		var loadCounter=0;
		var img;
		var id;
		for(i;i<len;i++){
			img=$(new Image());
			img.attr('id', i);
			img.css({
			   top : 0,
			   left : 0,
			   display : 'block'
			}).load(function() {
				loadCounter++;
				//console.log(this);
				id = $(this).attr('id');
				loadContent[id] = this;
				if(loadCounter == len){
					//console.log('stuff loaded');
					
					getCategoryData();
					makePlaylist();
					
					if(!singleCategory){
						makeMenu();
					}
					
					adjustPlaylist();
					
					positionPlaylistHolder();
					getThumbHolderSize();
					
					if(!singleCategory){
						getMenuHolderSize();
						disableActiveMenuItem();
						if(menuRollover) positionMenuRollover();
					}
					
					//after we get menuSize
					if(thumbOrientatation=='horizontal'){
						_thumbHolder.css('top', menuBeforeSpace + menuSize + menuThumbSpace +'px');
					}else{
						_thumbHolder.css('left', menuBeforeSpace + menuSize + menuThumbSpace +'px');
					}
					
					if(playlistIndex == 'inside' && autoOpenPlaylist){
						togglePlaylist();
					}
					
				}
			}).attr('src', contentUrl[i]);
		}
	}
	
	
	//************************* PLAYLIST *************************//
	
	function adjustPlaylist(){
		playlistCounter=0;
		if(thumbOrientatation=='horizontal'){
			_thumbHolder.css('height', thumbHeight + 2*thumbRolloverSize + 'px');
			thumbSize=parseInt(_thumbHolder.css('height'),10);
		}else{
			_thumbHolder.css('width', thumbWidth + 2*thumbRolloverSize + 'px');
			thumbSize=parseInt(_thumbHolder.css('width'),10);
		}
		if(playlistIndex == 'inside') playlistSize = menuBeforeSpace + menuSize + menuThumbSpace + thumbSize + thumbAfterSpace;
		//console.log(menuBeforeSpace, menuSize, menuThumbSpace, thumbSize, thumbAfterSpace, playlistSize);
		
		if(thumbOrientatation=='horizontal'){
			thumbWrapper.css('left', 0);
		}else{
			thumbWrapper.css('top', 0);
		}
		
		if(thumbRollover){
			thumbRollover.css('width', thumbWidth + 2*thumbRolloverSize + 'px');
			thumbRollover.css('height', thumbHeight + 2*thumbRolloverSize + 'px');
		}
	}
	
	function makePlaylist(){
	
		//playlist holder
		playlistHolder = $("<div/>");
		playlistHolder.css('position', 'absolute');
		playlistHolder.css('background', playlistBgColor);
		playlistHolder.css('zIndex', 105);
		if(playlistIndex == 'inside'){
			componentHolder.append(playlistHolder);
		}else{
			componentWrapper.append(playlistHolder);
		}
		if(playlist_toggle && fixPlaylistToggleBtn) playlistHolder.append(playlist_toggle);//reparent to playlist
		
		//MAIN THUMB HOLDER FOR ALIGNMENT
		_thumbHolder = $("<div/>");
		_thumbHolder.css('position', 'absolute');
		_thumbHolder.css('overflow', 'hidden');
		var thumbBgColor=settings.thumbBgColor;
		if(thumbBgColor != '') _thumbHolder.css('background', thumbBgColor);
		playlistHolder.append(_thumbHolder);
		
		
		//for rollover stroke
		var innerThumbHolder = $("<div/>");
		innerThumbHolder.css('position', 'absolute');
		if(thumbOrientatation=='horizontal'){
			innerThumbHolder.css('left', thumbRolloverSize+'px');
			innerThumbHolder.css('top', 0);
		}else{
			innerThumbHolder.css('left', 0);
			innerThumbHolder.css('top', thumbRolloverSize+'px');
		}
		_thumbHolder.append(innerThumbHolder);
		
		
		//THUMB WRAPPER, HOLDS THUMB DIVS
		innerThumbHolder.append(thumbWrapper);
		
		
		//THUMB ROLLOVER
		if(thumbRolloverSize>0){
			thumbRollover = $("<div/>");
			thumbRollover.css('position', 'absolute');
			thumbRollover.css('zIndex', 0);
			var thumbRolloverBorderRadius = settings.thumbRolloverBorderRadius;
			if(thumbRolloverBorderRadius>0) thumbRollover.css('borderRadius', thumbRolloverBorderRadius);
			if(thumbOrientatation=='horizontal'){
				thumbRollover.css('top', 0);
			}else{
				thumbRollover.css('left', 0);
			}
			var thumbRolloverColor = settings.thumbRolloverColor;
			thumbRollover.css('background', thumbRolloverColor);
			thumbWrapper.append(thumbRollover);
		}
		
		//PLAYLIST CONTROLS
		prevThumbBtn = $("<div/>");
		prevThumbBtn.css('display', 'none');
		prevThumbBtn.attr('id', 'prevThumbBtn');
		prevThumbBtn.css('position', 'absolute');
		prevThumbBtn.css('cursor', 'pointer');
		prevThumbBtn.append(loadContent[0]);
		playlistHolder.append(prevThumbBtn);
		prevThumbBtn.bind('click', togglePlaylistControls);
		
		nextThumbBtn = $("<div/>");
		nextThumbBtn.css('display', 'none');
		nextThumbBtn.attr('id', 'nextThumbBtn');
		nextThumbBtn.css('position', 'absolute');
		nextThumbBtn.css('cursor', 'pointer');
		nextThumbBtn.append(loadContent[1]);
		playlistHolder.append(nextThumbBtn);
		nextThumbBtn.bind('click', togglePlaylistControls);
	
	}
	
	function getThumbHolderSize(){
		var maxLeft;
		if(thumbOrientatation=='horizontal'){
			
			currentlyVisibleThumbs = Math.floor((_componentWidth - thumbBtnBuffer) / (thumbWidth + thumbSpacing));
			if(!maxVisibleThumbs && currentlyVisibleThumbs > visibleThumbs) currentlyVisibleThumbs = visibleThumbs;
			else if(currentlyVisibleThumbs > _playlistLength) currentlyVisibleThumbs = _playlistLength;
			else if(currentlyVisibleThumbs < minVisibleThumbs) currentlyVisibleThumbs = minVisibleThumbs;
			//console.log('currentlyVisibleThumbs=', currentlyVisibleThumbs);
			thumbHolderSize = currentlyVisibleThumbs*thumbWidth + (currentlyVisibleThumbs-1)*thumbSpacing+2*thumbRolloverSize;
			//console.log('thumbHolderSize=', thumbHolderSize);
			_thumbHolder.css('width', thumbHolderSize + 'px');//set new size
			
			//restrain thumbWrapper position (triggered on drag window right)
			maxLeft= -(_playlistLength*thumbWidth + (_playlistLength-1)*thumbSpacing) + thumbHolderSize-2*thumbRolloverSize;
			if(parseInt(thumbWrapper.css('left'), 10) < maxLeft){
				//console.log('maxLeft=', maxLeft);
				thumbWrapper.css('left', maxLeft);
			}
			
		}else{//vertical
		
			currentlyVisibleThumbs = Math.floor((_componentHeight - thumbBtnBuffer) / (thumbHeight + thumbSpacing));
			if(!maxVisibleThumbs && currentlyVisibleThumbs > visibleThumbs) currentlyVisibleThumbs = visibleThumbs;
			else if(currentlyVisibleThumbs > _playlistLength) currentlyVisibleThumbs = _playlistLength;
			else if(currentlyVisibleThumbs < minVisibleThumbs) currentlyVisibleThumbs = minVisibleThumbs;
			//console.log('currentlyVisibleThumbs=', currentlyVisibleThumbs);
			thumbHolderSize = currentlyVisibleThumbs*thumbHeight + (currentlyVisibleThumbs-1)*thumbSpacing+2*thumbRolloverSize;
			_thumbHolder.css('height', thumbHolderSize + 'px');//set new size
			
			//restrain thumbWrapper position 
			maxLeft= -(_playlistLength*thumbHeight + (_playlistLength-1)*thumbSpacing) + thumbHolderSize-2*thumbRolloverSize;
			if(parseInt(thumbWrapper.css('top'), 10) < maxLeft){
				thumbWrapper.css('top', maxLeft);
			}
		}
		
		//change playlistCounter
		if(playlistCounter + currentlyVisibleThumbs>_playlistLength-1){
			playlistCounter = _playlistLength - currentlyVisibleThumbs;
		}
		//console.log('playlistCounter=', playlistCounter);
		checkPlaylistControls();
		if(thumbRollover) positionThumbRollover();
		
		//position thumb holder
		if(thumbOrientatation=='horizontal'){
			if(!fixThumbs){
				_thumbHolder.css('left', playlistHolder.width()/2 - thumbHolderSize/2 + 'px');
				
				prevThumbBtn.css('left', playlistHolder.width()/2 - thumbHolderSize/2 - prevThumbBtn.width()-thumbBtnOffset + 'px');
				nextThumbBtn.css('left', playlistHolder.width()/2 + thumbHolderSize/2 +thumbBtnOffset + 'px');
			}else{
				_thumbHolder.css(fixThumbsSide, fixThumbsValue + 'px');
				if(fixThumbsSide=='left'){
					prevThumbBtn.css(fixThumbsSide, fixThumbsValue - prevThumbBtn.width()-thumbBtnOffset + 'px');
					nextThumbBtn.css(fixThumbsSide, fixThumbsValue + thumbHolderSize +thumbBtnOffset + 'px');
				}else{
					//reverse assignment for right
					nextThumbBtn.css(fixThumbsSide, fixThumbsValue - prevThumbBtn.width()-thumbBtnOffset + 'px');
					prevThumbBtn.css(fixThumbsSide, fixThumbsValue + thumbHolderSize +thumbBtnOffset + 'px');
				}
			}
			//position playlist btns
			prevThumbBtn.css('top', menuBeforeSpace+menuSize+menuThumbSpace+thumbHeight/2+thumbRolloverSize-prevThumbBtn.height()/2 +'px');
			nextThumbBtn.css('top', menuBeforeSpace+menuSize+menuThumbSpace+thumbHeight/2+thumbRolloverSize-nextThumbBtn.height()/2 +'px');
			
		}else{//vertical
			if(!fixThumbs){
				_thumbHolder.css('top', playlistHolder.height()/2 - thumbHolderSize/2 + 'px');
				
				prevThumbBtn.css('top', playlistHolder.height()/2 - thumbHolderSize/2 - prevThumbBtn.height()-thumbBtnOffset + 'px');
				nextThumbBtn.css('top', playlistHolder.height()/2 + thumbHolderSize/2 +thumbBtnOffset + 'px');
			}else{
				_thumbHolder.css(fixThumbsSide, fixThumbsValue + 'px');
				if(fixThumbsSide=='top'){
					prevThumbBtn.css('top', fixThumbsValue - prevThumbBtn.height()-thumbBtnOffset + 'px');
					nextThumbBtn.css('top', fixThumbsValue + thumbHolderSize +thumbBtnOffset + 'px');
				}else{
					//reverse assignment for bottom
					nextThumbBtn.css('top', fixThumbsValue - prevThumbBtn.height()-thumbBtnOffset + 'px');
					prevThumbBtn.css('top', fixThumbsValue + thumbHolderSize +thumbBtnOffset + 'px');
				}
			}
			//position playlist btns
			prevThumbBtn.css('left', menuBeforeSpace+menuSize+menuThumbSpace+thumbWidth/2+thumbRolloverSize-prevThumbBtn.width()/2 +'px');
			nextThumbBtn.css('left', menuBeforeSpace+menuSize+menuThumbSpace+thumbWidth/2+thumbRolloverSize-prevThumbBtn.width()/2 +'px');
		}
	}
	
	function togglePlaylist(){
		var ease='easeOutQuint',time=500,prop = {},animProp;
		if(playlistPosition == 'top'){
			animProp='top';	
			if(playlistOpened){
				prop[animProp] = - playlistSize + 'px';
			}else{
				prop[animProp] = 0;
			}
		}else if(playlistPosition == 'bottom'){
			animProp='top';	
			if(playlistOpened){
				prop[animProp] = _componentHeight + 'px';
			}else{
				prop[animProp] = _componentHeight - playlistSize + 'px';
			}
		}else if(playlistPosition == 'left'){
			animProp='left';	
			if(playlistOpened){
				prop[animProp] = - playlistSize + 'px';
			}else{
				prop[animProp] = 0;
			}
		}else if(playlistPosition == 'right'){
			animProp='left';
			if(playlistOpened){
				prop[animProp] = _componentWidth + 'px';
			}else{
				prop[animProp] = _componentWidth - playlistSize + 'px';
			}
		}
		//playlist toggle btn
		if(!playlistOpened){
			playlistToggleSrc.attr('src', settings.iconPath + 'minus_off.png');
			playlistOpened=true;
		}else{
			playlistToggleSrc.attr('src', settings.iconPath + 'plus_off.png');
			playlistOpened=false;
		}
		playlistHolder.stop().animate(prop,{duration: time, easing: ease});
	}
	
	function positionPlaylistHolder(){
		var toggleBtnOffset=10;
		
		if(playlistPosition == 'top'){
			playlistHolder.css('width', _componentWidth + 'px');
			playlistHolder.css('height', playlistSize + 'px');
			if(playlistOpened){
				playlistHolder.css('top', 0);
			}else{
				if(playlistIndex=='inside'){
					playlistHolder.css('top', - playlistSize + 'px');
				}else{
					playlistHolder.css('top', 0);
					componentHolder.css('top', playlistSize + 'px');
				}
			}
			playlistHolder.css('left', 0);
			
			if(playlistIndex=='inside' && fixPlaylistToggleBtn){
				playlist_toggle.css('top', playlistSize + toggleBtnOffset + 'px');
				playlist_toggle.css('left', toggleBtnOffset + 'px');
			}
			
		}else if(playlistPosition == 'bottom'){
			playlistHolder.css('width', _componentWidth + 'px');
			playlistHolder.css('height', playlistSize + 'px');
			if(playlistOpened){
				playlistHolder.css('top', _componentHeight - playlistSize + 'px');
			}else{
				playlistHolder.css('top', _componentHeight + 'px');
			}
			playlistHolder.css('left', 0);
			if(playlistIndex=='inside' && fixPlaylistToggleBtn){
				playlist_toggle.css('bottom', playlistSize + toggleBtnOffset + 'px');
				playlist_toggle.css('right', toggleBtnOffset + 'px');
			}
			
		}else if(playlistPosition == 'left'){
			playlistHolder.css('width', playlistSize + 'px');
			playlistHolder.css('height', _componentHeight + 'px');
			playlistHolder.css('top', 0);
			if(playlistOpened){
				playlistHolder.css('left', 0);
			}else{
				if(playlistIndex=='inside'){
					playlistHolder.css('left', -playlistSize + 'px');
				}else{
					playlistHolder.css('left', 0);
					componentHolder.css('left', playlistSize + 'px');
				}
			}
			if(playlistIndex=='inside' && fixPlaylistToggleBtn){
				playlist_toggle.css('top', toggleBtnOffset + 'px');
				playlist_toggle.css('left', playlistSize + toggleBtnOffset + 'px');
			}
		}else if(playlistPosition == 'right'){
			playlistHolder.css('width', playlistSize + 'px');
			playlistHolder.css('height', _componentHeight + 'px');
			playlistHolder.css('top', 0);
			if(playlistOpened){
				playlistHolder.css('left', _componentWidth-playlistSize + 'px');
			}else{
				playlistHolder.css('left', _componentWidth + 'px');
			}
			if(playlistIndex=='inside' && fixPlaylistToggleBtn){
				playlist_toggle.css('bottom', toggleBtnOffset + 'px');
				playlist_toggle.css('right', playlistSize + toggleBtnOffset + 'px');
			}
		}
	}
	
	function positionThumbRollover(moveThumbWrapper){
		if(getCounter()==-1) return;
		//console.log('_positionThumbRollover');
		var value=thumbPositionArr[getCounter()]-thumbRolloverSize;
		if (value)
		{
			if(thumbOrientatation=='horizontal'){
				thumbRollover.stop().animate({ 'left': value},  {duration: 500, easing: 'easeOutQuint'});
			}else{
				thumbRollover.stop().animate({ 'top': value},  {duration: 500, easing: 'easeOutQuint'});
			}
		}
		
		if(moveThumbWrapper){//follow thumb wrapper with counter
			//check if thumbwrapper has to be moved
			//console.log('getCounter() = '+ getCounter()+ ' playlistCounter = '+ playlistCounter+ ' currentlyVisibleThumbs = '+currentlyVisibleThumbs);
			if(getCounter()>playlistCounter-1+currentlyVisibleThumbs){
				//playlistCounter += currentlyVisibleThumbs;
				playlistCounter = getCounter();
				if(playlistCounter > _playlistLength - 1) playlistCounter = _playlistLength - 1;//restrain
				if(playlistCounter > _playlistLength - currentlyVisibleThumbs) playlistCounter = _playlistLength - currentlyVisibleThumbs;
				togglePlaylistControls2();
				//console.log('fwd, playlistCounter after = '+playlistCounter);
			}else if(getCounter()<playlistCounter){
				//playlistCounter -= currentlyVisibleThumbs;
				playlistCounter = getCounter();
				if(playlistCounter < 0) playlistCounter = 0;//restrain
				togglePlaylistControls2();
				//console.log('rew, playlistCounter after = '+playlistCounter);
			}
		}
	}
	
	function togglePlaylistControls2(){
		playlistTransitionOn=true;
		
		var newPos;
		if(thumbOrientatation=='horizontal'){
			newPos = playlistCounter * thumbWidth + (playlistCounter*thumbSpacing);
			thumbWrapper.stop().animate({ 'left': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkPlaylistControls();
			}});
		}else{
			newPos = playlistCounter * thumbHeight + (playlistCounter*thumbSpacing);
			thumbWrapper.stop().animate({ 'top': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkPlaylistControls();
			}});
		}
	}
	
	function togglePlaylistControls(e){
		//console.log('togglePlaylistControls');
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited || playlistTransitionOn) return;
		
		var currentTarget = e.currentTarget;
		var id = $(currentTarget).attr('id');
		
		if(id == 'prevThumbBtn'){
			if(playlistCounter == 0) return;
			playlistTransitionOn=true;
			
			playlistCounter -= currentlyVisibleThumbs;
			if(playlistCounter < 0) playlistCounter = 0;//restrain
			
		}else if(id == 'nextThumbBtn'){
			if(playlistCounter == _playlistLength - currentlyVisibleThumbs) return;
			playlistTransitionOn=true;
			
			playlistCounter += currentlyVisibleThumbs;
			if(playlistCounter > _playlistLength - 1) playlistCounter = _playlistLength - 1;//restrain
			if(playlistCounter > _playlistLength - currentlyVisibleThumbs) playlistCounter = _playlistLength - currentlyVisibleThumbs;
		}
		//console.log('playlistCounter = ', playlistCounter);
		
		var newPos;
		
		if(thumbOrientatation=='horizontal'){
			newPos = playlistCounter * thumbWidth + (playlistCounter*thumbSpacing);
			//console.log(newPos);
			thumbWrapper.stop().animate({ 'left': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkPlaylistControls();
			}});
		}else{
			newPos = playlistCounter * thumbHeight + (playlistCounter*thumbSpacing);
			//console.log(newPos);
			thumbWrapper.stop().animate({ 'top': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkPlaylistControls();
			}});
		}
		
		return false;
	}
	
	function checkPlaylistControls(){
		if(_playlistLength <= currentlyVisibleThumbs){
			prevThumbBtn.css('display', 'none');
			nextThumbBtn.css('display', 'none');
			return;
		}else{
			prevThumbBtn.css('display', 'block');
			nextThumbBtn.css('display', 'block');
		}
		
		if(playlistCounter == 0){
			prevThumbBtn.css('cursor', 'default');
			prevThumbBtn.css('opacity', 0.5);
		}else{
			prevThumbBtn.css('cursor', 'pointer');
			prevThumbBtn.css('opacity', 1);
		}
		
		if(playlistCounter + currentlyVisibleThumbs == _playlistLength){
			nextThumbBtn.css('cursor', 'default');
			nextThumbBtn.css('opacity', 0.5);
		}else{
			nextThumbBtn.css('cursor', 'pointer');
			nextThumbBtn.css('opacity', 1);
		}
		
		playlistTransitionOn=false;
	}
	
	
	//******************************* MENU ****************************//
	
	function makeMenu(){
		
		//MAIN MENU HOLDER FOR ALIGNMENT
		_menuHolder = $("<div/>");
		_menuHolder.css('position', 'absolute');
		_menuHolder.css('overflow', 'hidden');
		var menuBgColor=settings.menuBgColor;
		if(menuBgColor != '') _menuHolder.css('background', menuBgColor);
		if(menuOrientatation=='horizontal'){
			_menuHolder.css('top', menuBeforeSpace +'px');
		}else{
			_menuHolder.css('left', menuBeforeSpace +'px');
		}
		playlistHolder.append(_menuHolder);
		
		
		//for rollover stroke
		var innerMenuHolder = $("<div/>");
		innerMenuHolder.css('position', 'absolute');
		if(menuOrientatation=='horizontal'){
			innerMenuHolder.css('left', menuRolloverLRSize+'px');
			innerMenuHolder.css('top', menuRolloverTBSize+'px');
		}else{
			innerMenuHolder.css('left',menuRolloverLRSize+'px');
			innerMenuHolder.css('top', menuRolloverTBSize+'px');
		}
		_menuHolder.append(innerMenuHolder);
		
		
		//MENU WRAPPER, HOLDS MENU DIVS
		menuWrapper = $("<div/>");
		menuWrapper.css('position', 'absolute');
		if(thumbOrientatation=='horizontal'){
			menuWrapper.css('left', 0);
		}else{
			menuWrapper.css('top', 0);
		}
		innerMenuHolder.append(menuWrapper);
		
		
		//MENU ROLLOVER
		if(menuRolloverLRSize>0||menuRolloverTBSize>0){
			menuRollover = $("<div/>");
			menuRollover.css('position', 'absolute');
			menuRolloverBorderRadius = settings.menuRolloverBorderRadius;
			if(menuRolloverBorderRadius>0) menuRollover.css('borderRadius', menuRolloverBorderRadius);
			if(menuOrientatation=='horizontal'){
				menuRollover.css('top', -menuRolloverTBSize+'px');
			}else{
				menuRollover.css('left', -menuRolloverLRSize+'px');
			}
			var menuRolloverColor = settings.menuRolloverColor;
			menuRollover.css('background', menuRolloverColor);
			menuWrapper.append(menuRollover);
		}
		
		
		//MENU CONTROLS
		prevMenuBtn = $("<div/>");
		prevMenuBtn.css('display', 'none');
		prevMenuBtn.attr('id', 'prevMenuBtn');
		prevMenuBtn.css('position', 'absolute');
		prevMenuBtn.css('cursor', 'pointer');
		prevMenuBtn.append(loadContent[2]);
		playlistHolder.append(prevMenuBtn);
		prevMenuBtn.bind('click', toggleMenuControls);
		
		nextMenuBtn = $("<div/>");
		nextMenuBtn.css('display', 'none');
		nextMenuBtn.attr('id', 'nextMenuBtn');
		nextMenuBtn.css('position', 'absolute');
		nextMenuBtn.css('cursor', 'pointer');
		nextMenuBtn.append(loadContent[3]);
		playlistHolder.append(nextMenuBtn);
		nextMenuBtn.bind('click', toggleMenuControls);
		
		//build menu
		var m=0;
		var menuItem;
		var menuPosition=0;
		var fontMeasure = componentWrapper.find('.fontMeasure');
		
		//find max menu item width and height during creation
		for(m;m<_categoryLength;m++){
			menuItem = $('<div/>').html(categoryTitleArr[m]).addClass('menu_item').appendTo(fontMeasure);
			if(menuOrientatation=='horizontal'){
				menuItem.css('left', menuPosition + (m*menuSpacing) + 'px');
				menuItem.css('top', 0);
				menuPosition += menuItem.width();
				menuItemSizeArr.push(menuItem.width());
				menuItemPositionArr.push(parseInt(menuItem.css('left'),10));
			}else{
				menuItem.css('top', menuPosition + (m*menuSpacing) + 'px');
				menuItem.css('left', 0);
				menuPosition += menuItem.height();
				menuItemSizeArr.push(menuItem.height());
				menuItemSizeArr2.push(menuItem.width());
				menuItemPositionArr.push(parseInt(menuItem.css('top'),10));
			}
			menuItem.css('width', menuItem.width()+1 + 'px');
			if(maxMenuItemHeight<menuItem.height()) maxMenuItemHeight=menuItem.height();//find max height
			if(maxMenuItemWidth<menuItem.width()) maxMenuItemWidth=menuItem.width();//find max width
			menuItem.appendTo(menuWrapper);
			menuItem.attr('id', m);
			menuItem.bind('click', clickMenuItem);
			menuItem.css('cursor', 'pointer');
			menuItem.css('zIndex', 999);//fix click problem
			menuItemArr.push(menuItem);
		}
		
		preventSelect(menuItemArr);
		
		//only once alignment
		if(menuOrientatation=='horizontal'){
			_menuHolder.css('height', maxMenuItemHeight + 2*menuRolloverTBSize+'px');
			menuSize=parseInt(_menuHolder.css('height'),10);
		}else{//vertical
			_menuHolder.css('width', maxMenuItemWidth + 2*menuRolloverLRSize+'px');
			menuSize=parseInt(_menuHolder.css('width'),10);
		}
		fontMeasure.remove();//clean
		
	}
	
	
	
	function clickMenuItem(e){
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited) return;
		
		var currentTarget = $(e.currentTarget);
		var id = currentTarget.attr('id');
	
		if(id == activeCategory) return;//clicked active item
		
		if(categoryTransitionOn){
			if(!queCategoryRequest){
				queCategoryRequestID=id;
				queCategoryRequest=true;	
			}
			return;
		} 
		
		categoryTransitionOn=true;
		
		enableActiveMenuItem();
		activeCategory = id;
		//console.log('activeCategory = ', activeCategory);
		disableActiveMenuItem();
		if(menuRollover) positionMenuRollover();
		
		cleanCategory();

		return false;
	}
	
	function enableActiveMenuItem(){
		if(lastActiveMenuItem) lastActiveMenuItem.css('cursor', 'pointer');
	}
	
	function disableActiveMenuItem(){
		var menuItem=menuItemArr[activeCategory];
		menuItem.css('cursor', 'default');
		lastActiveMenuItem = menuItem;
	}
	
	function getCurrentMenuSize(startItem, endItem){
		var temp=0;
		for(startItem; startItem< endItem;startItem++){
			temp+=menuItemSizeArr[startItem]+menuSpacing;	
		}
		temp-=menuSpacing;//remove last menu spacing
		return temp;
	}
	
	function calculateMenuLeft(){
		//console.log('calculateMenuLeft');
		var measureSize;
		if(menuOrientatation=='horizontal'){
			measureSize=_componentWidth - menuBtnBuffer;
		}else{
			measureSize=_componentHeight - menuBtnBuffer;
		}
		if(measureSize < minPlaylistSize) measureSize = minPlaylistSize;
		//console.log('measureSize=', measureSize);
		//console.log('menuCounter=', menuCounter);
	
		var currentSize=0;
		var endItem=menuCounter;
		startItem=menuCounter;//count backwards
		var doLast=true;
		
		outer: while(currentSize < measureSize) {
			startItem--;
			if(!maxVisibleMenuItems && endItem-startItem > visibleMenuItems){
				 startItem = endItem-visibleMenuItems;
				 doLast = false;//no need to remove last item that broke while condition because we cut it here
				 currentSize = getCurrentMenuSize(startItem, endItem);
				 break outer;
			}
			if(startItem < 0){
				 startItem = 0;
				 doLast = false;
				 currentSize = getCurrentMenuSize(startItem, endItem);
				 //check if fit more than we have since we hit boundary (go upwards in the case)
				 
				 var doLast2=true;
				 while(currentSize < measureSize) {
					 endItem++;
					 if(!maxVisibleMenuItems && endItem > visibleMenuItems){//start item is now 0 (zero)
						 endItem = visibleMenuItems;
						 doLast2 = false;//no need to remove last item that broke while condition because we cut it here
						 currentSize = getCurrentMenuSize(0, endItem);
						 break outer;
					 }
					 if(endItem > _categoryLength){
						 endItem = _categoryLength;
						 doLast2 = false;
						 currentSize = getCurrentMenuSize(0, endItem);
						 break outer;
					 }
					 currentSize = getCurrentMenuSize(0, endItem);
				 }
				 if(doLast2){
					endItem--;//remove last item that broke while condition
					currentSize = getCurrentMenuSize(startItem, endItem);//recalculate
				 }
				 break outer;
			}
			currentSize = getCurrentMenuSize(startItem, endItem);
		
		}
		if(doLast){
			startItem++;//remove last item that broke while condition
			currentSize = getCurrentMenuSize(startItem, endItem);//recalculate
		}
		
		var newPos= menuItemPositionArr[startItem];
		if(menuOrientatation=='horizontal'){
			menuHolderSize = currentSize+ 2*menuRolloverLRSize;
			_menuHolder.css('width', menuHolderSize + 'px');//set new size
			if(!fixMenu){
				_menuHolder.css('left', playlistHolder.width()/2 - menuHolderSize/2 + 'px');
			}else{
				_menuHolder.css(fixMenuSide, fixMenuValue + 'px');
			}
			menuWrapper.stop().animate({ 'left': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkMenuControls();
			}});
		}else{
			menuHolderSize = currentSize+ 2*menuRolloverTBSize;
			_menuHolder.css('height', menuHolderSize + 'px');//set new size
			if(!fixMenu){
				_menuHolder.css('top', playlistHolder.height()/2 - menuHolderSize/2 + 'px');
			}else{
				_menuHolder.css(fixMenuSide, fixMenuValue + 'px');
			}
			menuWrapper.stop().animate({ 'top': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkMenuControls();
			}});
		}
		
		currentlyVisibleMenuItems = endItem-startItem;
		//console.log('currentlyVisibleMenuItems=', currentlyVisibleMenuItems);
		positionMenuBtns();
		if(menuRollover) positionMenuRollover();
	}	
		
	function getMenuHolderSize(){
		//console.log('getMenuHolderSize');
		var measureSize;
		if(menuOrientatation=='horizontal'){
			measureSize=_componentWidth - menuBtnBuffer;
		}else{
			measureSize=_componentHeight - menuBtnBuffer;
		}
		if(measureSize < minPlaylistSize) measureSize = minPlaylistSize;
		//console.log('measureSize=', measureSize);
		//console.log('menuCounter=', menuCounter);
	
		var currentSize=0;
		var endItem=menuCounter;
		var doLast=true;
		
		outer: while(currentSize < measureSize) {
			endItem++;
			if(!maxVisibleMenuItems && endItem-menuCounter > visibleMenuItems){
				 endItem = menuCounter+visibleMenuItems;
				 doLast = false;//no need to remove last item that broke while condition because we cut it here
				 currentSize = getCurrentMenuSize(menuCounter, endItem);
				 break outer;
			}
			if(endItem > _categoryLength){
				 endItem = _categoryLength;
				 doLast = false;
				 currentSize = getCurrentMenuSize(menuCounter, endItem);
				 //check if fit more than we have since we hit boundary (go downwards in the case)
				 
				 var doLast2=true;
				 while(currentSize < measureSize) {
					 menuCounter--;
					 if(!maxVisibleMenuItems && endItem-menuCounter > visibleMenuItems){
						 menuCounter = endItem-visibleMenuItems;
						 doLast2 = false;//no need to remove last item that broke while condition because we cut it here
						 currentSize = getCurrentMenuSize(menuCounter, _categoryLength);
						 break outer;
					 }
					 if(menuCounter < 0){
						 menuCounter = 0;
						 doLast2 = false;
						 currentSize = getCurrentMenuSize(0, _categoryLength);
						 break outer;
					 }
					 currentSize = getCurrentMenuSize(menuCounter, _categoryLength);
				 }
				 if(doLast2){
					menuCounter++;//remove last item that broke while condition
					currentSize = getCurrentMenuSize(menuCounter, endItem);//recalculate
				 }
				 break outer;
			}
			currentSize = getCurrentMenuSize(menuCounter, endItem);
			
		}
		if(doLast){
			endItem--;//remove last item that broke while condition
			currentSize = getCurrentMenuSize(menuCounter, endItem);//recalculate
		}
		
		var newPos= menuItemPositionArr[menuCounter];
		
		currentlyVisibleMenuItems = endItem-menuCounter;
		//console.log('currentlyVisibleMenuItems=', currentlyVisibleMenuItems);	
		if(menuOrientatation=='horizontal'){
			menuHolderSize = currentSize+ 2*menuRolloverLRSize;
			_menuHolder.css('width', menuHolderSize + 'px');//set new size
			if(!fixMenu){
				_menuHolder.css('left', playlistHolder.width()/2 - menuHolderSize/2 + 'px');
			}else{
				_menuHolder.css(fixMenuSide, fixMenuValue + 'px');
			}
			menuWrapper.stop().animate({ 'left': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkMenuControls();
			}});
		}else{
			menuHolderSize = currentSize+ 2*menuRolloverTBSize;
			_menuHolder.css('height', menuHolderSize + 'px');//set new size
			if(!fixMenu){
				_menuHolder.css('top', playlistHolder.height()/2 - menuHolderSize/2 + 'px');
			}else{
				_menuHolder.css(fixMenuSide, fixMenuValue + 'px');
			}
			menuWrapper.stop().animate({ 'top': -newPos + 'px'},  {duration: 500, easing: 'easeOutQuint', complete: function(){
				checkMenuControls();
			}});
		}
		positionMenuBtns();
		if(menuRollover) positionMenuRollover();
	}	
	
	function positionMenuBtns(){
		//console.log('positionMenuBtns');
		if(menuOrientatation=='horizontal'){
			prevMenuBtn.css('top', menuBeforeSpace +maxMenuItemHeight/2+menuRolloverTBSize-prevMenuBtn.height()/2+menuBtnPosOffset +'px');
			nextMenuBtn.css('top', menuBeforeSpace +maxMenuItemHeight/2+menuRolloverTBSize-prevMenuBtn.height()/2+menuBtnPosOffset +'px');
			if(!fixMenu){
				prevMenuBtn.css('left', playlistHolder.width()/2 - menuHolderSize/2 - prevMenuBtn.width()-menuBtnOffset + 'px');
				nextMenuBtn.css('left', playlistHolder.width()/2 + menuHolderSize/2 + menuBtnOffset + 'px');
			}else{
				if(fixMenuSide=='left'){
					prevMenuBtn.css(fixMenuSide, fixMenuValue - prevMenuBtn.width()-menuBtnOffset + 'px');
					nextMenuBtn.css(fixMenuSide, fixMenuValue + parseInt(_menuHolder.css('width'),10) + menuBtnOffset + 'px');
				}else{
					//reverse assignment for right
					nextMenuBtn.css(fixMenuSide, fixMenuValue - prevMenuBtn.width()-menuBtnOffset + 'px');
					prevMenuBtn.css(fixMenuSide, fixMenuValue + parseInt(_menuHolder.css('width'),10) + menuBtnOffset + 'px');
				}
			}
		}else{
			prevMenuBtn.css('left', menuBeforeSpace +maxMenuItemWidth/2+menuRolloverLRSize-prevMenuBtn.width()/2+menuBtnPosOffset +'px');
			nextMenuBtn.css('left', menuBeforeSpace +maxMenuItemWidth/2+menuRolloverLRSize-prevMenuBtn.width()/2+menuBtnPosOffset +'px');
			if(!fixMenu){
				prevMenuBtn.css('top', playlistHolder.height()/2 - menuHolderSize/2 - prevMenuBtn.height()-menuBtnOffset + 'px');
				nextMenuBtn.css('top', playlistHolder.height()/2 + menuHolderSize/2 + menuBtnOffset + 'px');
			}else{
				if(fixMenuSide=='top'){
					prevMenuBtn.css(fixMenuSide, fixMenuValue - prevMenuBtn.height()-menuBtnOffset + 'px');
					nextMenuBtn.css(fixMenuSide, fixMenuValue + parseInt(_menuHolder.css('height'),10) + menuBtnOffset + 'px');
				}else{
					//reverse assignment for bottom
					nextMenuBtn.css(fixMenuSide, fixMenuValue - prevMenuBtn.height()-menuBtnOffset + 'px');
					prevMenuBtn.css(fixMenuSide, fixMenuValue + parseInt(_menuHolder.css('height'),10) + menuBtnOffset + 'px');
				}
			}
		}
	}
	
	function positionMenuRollover(){
		var pos;
		var w;
		if(menuOrientatation=='horizontal'){
			w = menuItemSizeArr[activeCategory] + 2*menuRolloverLRSize + 'px';
			menuRollover.css('height', maxMenuItemHeight + 2*menuRolloverTBSize + 'px');
			pos = menuItemPositionArr[activeCategory]- menuRolloverLRSize;
			menuRollover.stop().animate({ 'left': pos, 'width':w},  {duration: 500, easing: 'easeOutQuint'});
		}else{
			w = menuItemSizeArr2[activeCategory]+2*menuRolloverLRSize + 'px';
			menuRollover.css('height', maxMenuItemHeight+2*menuRolloverTBSize + 'px');
			pos = menuItemPositionArr[activeCategory] - menuRolloverTBSize;
			menuRollover.stop().animate({ 'top': pos, 'width':w},  {duration: 500, easing: 'easeOutQuint'});
		}
	}
	
	function toggleMenuControls(e){
		//console.log('toggleMenuControls');
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited || menuTransitionOn) return;
		
		var currentTarget = e.currentTarget;
		var id = $(currentTarget).attr('id');
		
		if(id == 'prevMenuBtn'){
			if(menuCounter == 0) return;
			//console.log('prev click');
			menuTransitionOn=true;
			calculateMenuLeft();
			menuCounter=startItem;
			if(menuCounter<0) menuCounter = 0;
		}else if(id == 'nextMenuBtn'){
			if(menuCounter == _categoryLength - currentlyVisibleMenuItems) return;
			//console.log('next click');
			menuTransitionOn=true;
			menuCounter += currentlyVisibleMenuItems;
			if(menuCounter>_categoryLength-1) menuCounter = _categoryLength-1;
			getMenuHolderSize();
		}
		//if(menuRollover) positionMenuRollover();
		
		return false;
	}
	
	function checkMenuControls(){
		//console.log('checkMenuControls ', menuCounter, currentlyVisibleMenuItems);
		
		if(_categoryLength <= currentlyVisibleMenuItems){
			prevMenuBtn.css('display', 'none');
			nextMenuBtn.css('display', 'none');
			return;
		}else{
			prevMenuBtn.css('display', 'block');
			nextMenuBtn.css('display', 'block');
		}
		
		if(menuCounter == 0){
			prevMenuBtn.css('cursor', 'default');
			prevMenuBtn.css('opacity', 0.5);
		}else{
			prevMenuBtn.css('cursor', 'pointer');
			prevMenuBtn.css('opacity', 1);
		}
		
		if(menuCounter + currentlyVisibleMenuItems == _categoryLength){
			nextMenuBtn.css('cursor', 'default');
			nextMenuBtn.css('opacity', 0.5);
		}else{
			nextMenuBtn.css('cursor', 'pointer');
			nextMenuBtn.css('opacity', 1);
		}
		
		menuTransitionOn=false;
	}
	
	
	
	
	
	//******************** CHATEGORY CHANGE ************************ //
	
	function cleanCategory(){
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		if(loadRequestIntervalID) clearInterval(loadRequestIntervalID);
		mediaUnloadedAction();
		
		var i=0;
		var thumb;
		for(i;i<_playlistLength;i++){
			thumb=thumbItemArr[i];
			if(thumb){
				thumb.remove();
				thumb=null;
			}
		}
		thumbItemArr=[];
		
		_holder1.stop().empty();
		_holder2.stop().empty();
		_holder1.css('zIndex', 0);
		_holder2.css('zIndex', 1);
		_holder1.css('opacity', 1);
		_holder2.css('opacity', 1);
		_holder1.css('background', 'none');
		_holder2.css('background', 'none');
		_holder1.css('overflow', 'visible');
		_holder2.css('overflow', 'visible');
		_holder1.css('display', 'none');
		_holder2.css('display', 'none');
		componentHolder.css('background', 'none');
		
		categoryTransitionOn=false;
		categoryIntroHappened=false;
		
		if(queCategoryRequest){
			queCategoryRequest=false;
			enableActiveMenuItem();
			activeCategory=queCategoryRequestID;
			disableActiveMenuItem();
			if(menuRollover) positionMenuRollover();
			cleanCategory();
			return;
		} 
		
		getCategoryData();
		
		adjustPlaylist();
		positionPlaylistHolder();
		getThumbHolderSize();
		
		if(!singleCategory) getMenuHolderSize();
	}
	
	function getCategoryData(){
		//reset
		_counter=-1;
		thumbPositionArr=[];
		transitionIntroHappened=false;
		loadRequestPause = false;
		kenBurnsTransitionOn=false;
		queMediaRequest=false;	
		categoryDataArr=[];
		lastActiveThumb=null;
		
		currentData=$(dataArr[activeCategory]);
		categoryDataArr=currentData.children('a[title=media]');
		//console.log(categoryDataArr);
		_playlistLength=categoryDataArr.length;
		if(visibleThumbs>_playlistLength) visibleThumbs=_playlistLength;
		if(_randomPlay) makeRandomList();
		
		_transitionType = (currentData.attr('data-transitionType')).toUpperCase();
		if(_transitionType != 'SLIDE' && _transitionType != 'SPLIT' && _transitionType != 'REVEAL' && _transitionType != 'KEN_BURNS' && _transitionType != 'ALPHA' && _transitionType != 'ZOOM'){
			alert('Invalid transitionType on category number: ' + activeCategory);
			_transitionType == 'ALPHA';//reserve
		}
		
		if(_transitionType != 'KEN_BURNS'){
		
			var fitMode = currentData.attr('data-imageFitMode');
			if(fitMode != 'fit-inside' && fitMode != 'fit-outside'){
				alert("Invalid imageFitMode on category number: " + activeCategory);
				fitMode == 'fit-outside';//reserve
			}else{
				fitMode == 'fit-inside' ? imageFitMode = true : imageFitMode = false;
				if(forceImageFitMode) imageFitMode=true;
			}
			getSlideshowDelay();
			transitionEase = currentData.attr('data-transitionEase');
			transitionTime = parseInt(currentData.attr('data-transitionTime'), 10);
		
		}
		
		thumbWidth = parseInt(currentData.attr('data-thumbWidth'), 10);
		thumbHeight = parseInt(currentData.attr('data-thumbHeight'), 10);
		componentBgColor = currentData.attr('data-bgColor');
		//console.log(_playlistLength, _transitionType, imageFitMode);
		
		if(mediaObj[activeCategory].mainLoaded == false){
			_categoryMainLoaded=false;
		}
		makeThumbPlaylist();
		
		if(!_categoryMainLoaded){
			 getMainUrl();	
		}else{
			categoryIntroHappened=true;
			nextMedia();	
		}
		
	}
	
	function makeThumbPlaylist(){
		//console.log('makeThumbPlaylist');
		var i = 0;
		var img;
		var imageUrl;
		var data;
		thumbArr = [];
		var thumbHolder;
		var position=0;
		for(i; i<_playlistLength;i++){
			data = $(categoryDataArr[i]);
			
			thumbHolder = $("<div/>");
			thumbHolder.attr('id', i);
			thumbHolder.css('position', 'absolute');
			thumbHolder.css('zIndex', i+1);
			thumbHolder.css('overflow', 'hidden');
			if(thumbBorderRadius>0) thumbHolder.css('borderRadius', thumbBorderRadius);
			if(thumbOrientatation=='horizontal'){
				thumbHolder.css('top', thumbRolloverSize + 'px');
				var left = position + (i*thumbSpacing);
				thumbHolder.css('left', left + 'px');
				thumbPositionArr[i] = left;
				position += thumbWidth;
			}else{
				var top = position + (i*thumbSpacing);
				thumbHolder.css('top', top + 'px');
				thumbPositionArr[i] = top;
				thumbHolder.css('left', thumbRolloverSize + 'px');
				position += thumbHeight;
			}
			
			thumbHolder.css('width', thumbWidth + 'px');
			thumbHolder.css('height', thumbHeight + 'px');
			//thumbHolder.css('background', '#235');
			thumbHolder.css('cursor', 'pointer');
			thumbHolder.bind('click', clickThumb);
			
			
			img =$(new Image());
			thumbArr[i]=img;
			img.css('position', 'absolute');
			img.css('width', thumbWidth + 'px');
			img.css('height', thumbHeight + 'px');
			img.attr('id', i);
			img.css('top', 0);
			img.css('left', 0);
			img.css('display', 'block');
			
			imageUrl = data.attr('data-thumb');//+"?rand=" + (Math.random() * 99999999);
			//console.log(imageUrl);
				
			img.load(function() {
			}).attr('src', imageUrl);
				
			img.error(function(e) {
				//console.log('image load error: ' + e, i);
			});
			
			thumbHolder.append(img);
			thumbWrapper.append(thumbHolder);
			
			thumbItemArr.push(thumbHolder);
		}
		preventSelect(thumbItemArr);
	}
	
	function clickThumb(e){
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited || loadRequestPause || queMediaRequest) return;
		
		var currentTarget = $(e.currentTarget);
		var id = currentTarget.attr('id');
		
		if(id == getCounter()) return;//clicked active thumb
		_thumbClick=true;
		
		if(_transitionType != 'KEN_BURNS'){
			if(transitionOn){
				if(!queMediaRequest){
					queMediaRequestID=id;
					queMediaRequest=true;	
				}
			}else{
				enableActiveThumb();
				_counter = id;
				triggerMedia();	
			}
		}else{
			if(!kenBurnsTransitionOn){
				if(!queMediaRequest){
					queMediaRequestID=id;
					queMediaRequest=true;	
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					transitionEndKB();
				}
			}
		}
		return false;
	}
	
	function enableActiveThumb(){
		if(lastActiveThumb) lastActiveThumb.css('cursor', 'pointer');
	}
	
	function disableActiveThumb(){
		var thumb=thumbItemArr[getCounter()];
		thumb.css('cursor', 'default');
		lastActiveThumb = thumb;
	}
	
	//**************** IMAGE LOADING PROCESS *************/	
	
	function loadImage(i){
		if(categoryTransitionOn) return;
		_mediaLoadOn=true;
		var img;
		var imageUrl;
		var data = $(categoryDataArr[i]);
		var imgLoaded;
		var id;
		var mainArr = mediaObj[activeCategory].main;
		
		img =$(new Image());
		img.attr('id', i);
		img.css('top', 0);
		img.css('left', 0);
		img.css('display', 'block');
		
		if( _transitionType=='SLIDE' || _transitionType=='SPLIT' || _transitionType=='REVEAL' ){
			img.css('position', 'absolute');
		}else if( _transitionType=='KEN_BURNS' || _transitionType=='ALPHA'  || _transitionType=='ZOOM' ){
			img.css('position', 'relative');
			img.css('width', 100 + '%');
			img.css('height', 100 + '%');
		}
	
		imageUrl = data.attr('data-main');//+"?rand=" + (Math.random() * 99999999);
		//console.log(imageUrl);
			
		img.load(function() {
			
			imgLoaded = $(this);
			id = imgLoaded.attr('id');
				
			this.origWidth = this.width;
			this.origHeight = this.height;
			
			mainArr[id] = imgLoaded;//store loaded image
			//console.log('img loaded ', i);
			_mediaLoadOn=false;
			
			if(loadRequestPause){
				loadRequestPause = false;	
				callTransition();
			}
			
			if(!_categoryMainLoaded && !loadRequestPause) getMainUrl();
			
			if(!categoryIntroHappened){
				categoryIntroHappened=true;
				componentInited=true;
				nextMedia();
			}
			
		}).attr('src', imageUrl);
			
		img.error(function(e) {
			//console.log('image load error: ' + e, i);
		});
	}
	
	//find next unloaded image, return url
	function getMainUrl(){
		var i=0;
		var found=false;
		var mainArr = mediaObj[activeCategory].main;
		
		if(_randomPlay){
			for(i; i<_playlistLength;i++){
				if(mainArr[_randomArr[i]] == undefined){
					found = true;
					loadImage(_randomArr[i]);
					break;	
				}
			}
		}else{
			for(i; i<_playlistLength;i++){
				if(mainArr[i] == undefined){
					found = true;
					loadImage(i);
					break;	
				}
			}
		}
		
		if(!found){
			mediaObj[activeCategory].mainLoaded = true;
			_categoryMainLoaded=true;
		} 
	}
	
	function loadRequest(){
		loadRequestPause = true;
		//check if loading is in process
		if(_mediaLoadOn){
			if(loadRequestIntervalID) clearInterval(loadRequestIntervalID);
			loadRequestIntervalID = setInterval(waitCurrentLoad, loadRequestInterval);
		}else{
			loadImage(getCounter());
		}
	}
	
	function waitCurrentLoad(){
		if(!_mediaLoadOn){//wait for current load to finish
			if(loadRequestIntervalID) clearInterval(loadRequestIntervalID);
			if(mainArr[getCounter()]){//wanted media was loading, we have it now
				loadRequestPause = false;
				if(!_categoryMainLoaded) getMainUrl();
				callTransition();
			}else{//load requested
				loadImage(getCounter());
			}
		}
	}
	
	
	//**************** TRANSITIONS *************/
	
	function callTransition(){
		//console.log('callTransition');
		switch( _transitionType){
			case 'SLIDE':
				transitionSlide();
			break;	
			case 'SPLIT':
				transitionSplit();
			break;
			case 'REVEAL':
				transitionReveal();
			break;
			case 'KEN_BURNS':
				transitionKenBurns();	
			break;
			case 'ALPHA':
				transitionAlpha();
			break;
			case 'ZOOM':
				transitionZoom();
			break;
		}

		//UPG_PhotoLoad
		var umgid = $(categoryDataArr[getCounter()]).attr("data-umgid") * 1;
		if(umgid > 0 && typeof(UPG_onPhotoLoad) != "undefined") UPG_onPhotoLoad(umgid);
	}
	
	//**************** SLIDE *************/
	
	function transitionSlide(){
		//console.log('transitionSlide');
		 transitionOn = true;
		 
		 var mainArr = mediaObj[activeCategory].main;
		 if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var currentHolder = getEmptyHolder(true);
		 currentHolder.css('display', 'block');
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		if(componentBgColor != undefined){
			_holder1.css('background', componentBgColor);
			_holder2.css('background', componentBgColor);
		}
		checkLink([content]);	
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
			 
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('overflow', 'hidden');
		
		if(usePreloader) hidePreloader();
		
		if(transitionIntroHappened){
			
			_slideCase = getRandomNotLast( _slideCaseArr );
			//console.log(_slideCase);
			
			positionForSlideIn(currentHolder);
			currentHolder.append(content);
			var otherHolder = getOtherHolder(currentHolder);
			executeSlide( currentHolder, otherHolder );//inTarget, outTarget
		}else{
			currentHolder.css('left', 0 + 'px');
			currentHolder.css('top', 0 + 'px');
			currentHolder.css('opacity', 0);
			currentHolder.append(content);
			
			currentHolder.stop().animate({ 'opacity': 1},  {duration: _firstImageTime, easing: _firstImageEase, complete: function(){
				transitionEnd();
			}});
		}
		transitionIntroHappened = true;
		 
	 }
	 
	 function positionForSlideIn( target ) {
			
		switch(_slideCase){
		
			case "top":
				target.css('left', 0);
				target.css('top', - _componentHeight + 'px');
			break;
			
			case "left":
				target.css('left', - _componentWidth + 'px');
				target.css('top', 0);
			break;
			
			case "bottom":
				target.css('left', 0);
				target.css('top', _componentHeight + 'px');
			break;
			
			case "right":
				target.css('left', _componentWidth + 'px');
				target.css('top', 0);
			break;
		
		}
	}
	
	function executeSlide( inTarget, outTarget ) {
			
		switch(_slideCase){
			case "top":
				inTarget.stop().animate({ 'top': 0},  {duration: transitionTime, easing: transitionEase});
				outTarget.stop().animate({ 'top': _componentHeight},  {duration: transitionTime, easing: transitionEase, complete: function(){
					transitionEnd(outTarget);
				}});
			break;
			
			case "bottom":
				inTarget.stop().animate({ 'top': 0},  {duration: transitionTime, easing: transitionEase});
				outTarget.stop().animate({ 'top': - _componentHeight},  {duration: transitionTime, easing: transitionEase, complete: function(){
					transitionEnd(outTarget);
				}});
			break;
		
			case "left":
				inTarget.stop().animate({ 'left': 0},  {duration: transitionTime, easing: transitionEase});
				outTarget.stop().animate({ 'left': _componentWidth},  {duration: transitionTime, easing: transitionEase, complete: function(){
					transitionEnd(outTarget);
				}});
			break;
			
			case "right":
				inTarget.stop().animate({ 'left': 0},  {duration: transitionTime, easing: transitionEase});
				outTarget.stop().animate({ 'left': -_componentWidth},  {duration: transitionTime, easing: transitionEase, complete: function(){
					transitionEnd(outTarget);
				}});
			break;
		}
	
	}
	
	//**************** SPLIT *************/
	
	function transitionSplit(){
		
		 transitionOn = true;
		 
		 var mainArr = mediaObj[activeCategory].main;
		 if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		 	
		 var content2 = content.clone();
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var currentHolder = getEmptyHolder(true);
		 currentHolder.css('display', 'block');
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		checkLink([content, content2]);	
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
		
		content2.css('width', w + 'px');
		content2.css('height', h + 'px');
			 
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('left', 0 + 'px');
		currentHolder.css('top', 0 + 'px');
		currentHolder.css('overflow', 'hidden');
		
		_splitCase = getRandomNotLast( _splitCaseArr );
		//console.log(_splitCase);
		currentHolder.splitCase=_splitCase;//remember split case since we split previous image below current one
		makeSplit(content, content2, currentHolder, w, h);
		
		if(usePreloader) hidePreloader();
		
		if(transitionIntroHappened){
			var otherHolder = getOtherHolder(currentHolder);
			otherHolder.css('display', 'block');
			swapChildren(otherHolder, currentHolder);
			executeSplit( otherHolder );
		}else{
			currentHolder.css('opacity', 0);
			currentHolder.stop().animate({ 'opacity': 1},  {duration: _firstImageTime, easing: _firstImageEase, complete: function(){
				transitionEnd();
			}});
		}
		transitionIntroHappened = true;
		 
	 }
	 
	 function makeSplit(content, content2, currentHolder, w, h) {
		 
		 var split1;
		 var split2;
		 var cut;
		 
		 if(_splitCase == 'horizontalUpLeft' || _splitCase == 'horizontalUpRight' || _splitCase == 'horizontalSplit'){
			 
			split1 = $("<div/>");
			split1.attr('data-title', 'split1');
			split1.css('background', componentBgColor);
			split1.css('position', 'absolute');
			split1.css('top', 0);
			split1.css('left', 0);
			split1.css('width', _componentWidth + 'px');
			split1.css('height', _componentHeight/2 + 'px');
			split1.css('overflow', 'hidden');
			split1.append(content);
			currentHolder.append(split1);
			
			split2 = $("<div/>");
			split2.attr('data-title', 'split2');
			split2.css('background', componentBgColor);
			split2.css('position', 'absolute');
			split2.css('top', _componentHeight/2 + 'px');
			split2.css('left', 0);
			split2.css('width', _componentWidth + 'px');
			split2.css('height', _componentHeight/2 + 'px');
			split2.css('overflow', 'hidden');
			split2.append(content2);
			currentHolder.append(split2);
			
			cut = (_componentHeight - h) / 2;
			
			//move second image inside
			content2.css('left', _componentWidth/2-w/2 + 'px');
			content2.css('top', -_componentHeight/2+ cut + 'px');
			 
		}else  if(_splitCase == 'verticalUpLeft' || _splitCase == 'verticalDownLeft' || _splitCase == 'verticalSplit'){
			 
			split1 = $("<div/>");
			split1.attr('data-title', 'split1');
			split1.css('background', componentBgColor);
			split1.css('position', 'absolute');
			split1.css('top', 0);
			split1.css('left', 0);
			split1.css('width', _componentWidth /2 + 'px');
			split1.css('height', _componentHeight + 'px');
			split1.css('overflow', 'hidden');
			split1.append(content);
			currentHolder.append(split1);
			
			split2 = $("<div/>");
			split2.attr('data-title', 'split2');
			split2.css('background', componentBgColor);
			split2.css('position', 'absolute');
			split2.css('top', 0);
			split2.css('left', _componentWidth / 2 + 'px');
			split2.css('width', _componentWidth / 2 + 'px');
			split2.css('height', _componentHeight + 'px');
			split2.css('overflow', 'hidden');
			split2.append(content2);
			currentHolder.append(split2);
			
			//move second image inside
			content2.css('left', - w/2 + 'px');
			content2.css('top', _componentHeight/2- h/2 + 'px');
			 
		}
	 }
		
	 function executeSplit(target) {
		 
		 _splitCase = target.splitCase;//get previous split case
		 
		var split1=$(target.children('div[data-title=split1]'));
		var split2=$(target.children('div[data-title=split2]'));
		
		 if(_splitCase == 'horizontalUpLeft'){
			split1.stop().animate({ 'left': - _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'left': _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_splitCase == 'horizontalUpRight'){
			split1.stop().animate({ 'left': _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'left': - _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_splitCase == "horizontalSplit"){
			split1.stop().animate({ 'top': -_componentHeight/2 + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'top': _componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_splitCase == "verticalUpLeft"){
			split1.stop().animate({ 'top': - _componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'top': _componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}	
		else if(_splitCase == "verticalDownLeft"){
			split1.stop().animate({ 'top': _componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'top': -_componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}	
		else if(_splitCase == "verticalSplit"){
			split1.stop().animate({ 'left': - _componentWidth/2 + 'px'},  {duration: transitionTime, easing: transitionEase});
			split2.stop().animate({ 'left': _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}	
	}
	
	//**************** REVEAL *************/
	
	function transitionReveal(){
		 
		 transitionOn = true;
		 
		 var mainArr = mediaObj[activeCategory].main;
		 if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var currentHolder = getEmptyHolder(true);
		 currentHolder.css('display', 'block');
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		if(componentBgColor != undefined){
			_holder1.css('background', componentBgColor);
			_holder2.css('background', componentBgColor);
		}
		checkLink([content]);
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
			 
		currentHolder.css('overflow', 'hidden');
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('left', 0 + 'px');
		currentHolder.css('top', 0 + 'px');
		
		if(usePreloader) hidePreloader();
		
		if(transitionIntroHappened){
			_revealCase = getRandomNotLast( _revealCaseArr );
			var otherHolder = getOtherHolder(currentHolder);
			swapChildren(otherHolder, currentHolder);
			currentHolder.append(content);
			executeReveal( otherHolder );//inTarget, outTarget
		}else{
			currentHolder.css('opacity', 0);
			currentHolder.append(content);
			
			currentHolder.stop().animate({ 'opacity': 1},  {duration: _firstImageTime, easing: _firstImageEase, complete: function(){
				transitionEnd();
			}});
		}
		transitionIntroHappened = true;
		 
	 }
		
	 function executeReveal(target) {
				
		if(_revealCase == "top"){
			target.stop().animate({ 'top': - _componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_revealCase == "bottom"){
			target.stop().animate({ 'top':_componentHeight + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_revealCase == "right"){
			target.stop().animate({ 'left': _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}
		else if(_revealCase == "left"){
			target.stop().animate({ 'left':- _componentWidth + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(target);
			}});
		}	
	}
	
	//**************** ALPHA *************/
	
	function transitionAlpha(){
		 
		 transitionOn = true;
		 
		 var mainArr = mediaObj[activeCategory].main;
		 if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()][0];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		 
		 var originalWidth = content.origWidth;
		 var originalHeight = content.origHeight;
		 
		 var currentHolder = getEmptyHolder(true);
		 currentHolder.css('display', 'block');
		 currentHolder.css('opacity', 0);
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		if(componentBgColor != undefined) componentHolder.css('background', componentBgColor);
		checkLink([content]);	
			 
		currentHolder.css('width', w + 'px');
		currentHolder.css('height', h + 'px');
		currentHolder.css('left', _componentWidth/2-w/2 + 'px');
		currentHolder.css('top', _componentHeight/2-h/2 + 'px');
		
		currentHolder.append(content);
		
		if(usePreloader) hidePreloader();
		
		if(transitionIntroHappened){//animate old out
			var otherHolder = getOtherHolder(currentHolder);
			otherHolder.stop().animate({ 'opacity':0},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd(otherHolder);
			}});
			//animate new in	
			currentHolder.stop().animate({ 'opacity': 1},  {duration: transitionTime, easing: transitionEase});
		}else{
			//animate new in	
			currentHolder.stop().animate({ 'opacity': 1},  {duration: transitionTime, easing: transitionEase, complete: function(){
				transitionEnd();
			}});
		}
		
		transitionIntroHappened = true;
		 
	 }
	
	//**************** ZOOM *************/
	 
	  function transitionZoom(){//zoom in
		 
		 transitionOn = true;
		 
		 var mainArr = mediaObj[activeCategory].main;
		 if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		if(componentBgColor != undefined) componentHolder.css('background', componentBgColor);
		checkLink([content]);
		
		var currentHolder = getEmptyHolder(true);
		currentHolder.css('display', 'block');
		var otherHolder = getOtherHolder(currentHolder);
		swapChildren(currentHolder, otherHolder);
		
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('left', 0);
		currentHolder.css('top', 0);
		currentHolder.css('overflow', 'hidden');
		
		currentHolder.append(content);
		 
		//position randomly
		content.css('left', Math.random() * _componentWidth + 'px');
		content.css('top', Math.random() * _componentHeight + 'px');
		content.css('width', 0 + 'px');
		content.css('height', 0+ 'px');	
		
		if(usePreloader) hidePreloader();
		
		if(transitionIntroHappened){	
			 content.animate({ 'width': w+ 'px', 'height': h+ 'px', 'left': _componentWidth/2-w/2 + 'px', 'top':_componentHeight/2-h/2 + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				 transitionEnd(otherHolder);
			}});
		}else{
			 content.animate({ 'width': w+ 'px', 'height': h+ 'px', 'left': _componentWidth/2-w/2 + 'px', 'top':_componentHeight/2-h/2 + 'px'},  {duration: transitionTime, easing: transitionEase, complete: function(){
				 transitionEnd();
			}});
		}
		
		transitionIntroHappened=true;
		 
	 }
	 
	 function transitionEnd(otherHolder, split1, split2){
		 //console.log('transitionEnd');
		 if(categoryTransitionOn) return;
		 if(otherHolder){
			 $(otherHolder).empty();
			 otherHolder.css('display', 'none'); 
		 }
		 transitionOn=false;
		
		 mediaLoadedAction();
		 _thumbClick=false;//reset
		 
		 if(queMediaRequest){
			  if(queMediaRequestID=='prev'){
				  previousMedia();
			  }else if(queMediaRequestID=='next'){
				  nextMedia();
			  }else{
				  _counter=queMediaRequestID;
				  triggerMedia(true);
			  }
			queMediaRequest=false;
			return;	
		}
		 
		 if(slideshowOn){
			if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
			slideshowTimeoutID = setTimeout(nextMedia, getSlideshowDelay());
		}
	 }
	 
	 function transitionEndKB(){
		 //console.log('transitionEndKB');
		 if(categoryTransitionOn) return;
		 if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		 
		 if(queMediaRequest){
			  if(queMediaRequestID=='prev'){
				  previousMedia();
			  }else if(queMediaRequestID=='next'){
				  nextMedia();
			  }else{
				  _counter=queMediaRequestID;
				  triggerMedia(true);
			  }
		}else{
			//console.log('case kb check');
			nextMedia();	
		}
	 }
		
	//*************** KEN BURNS **********/
	
	 function transitionKenBurns(){
		//console.log("transitionKenBurns");
		transitionOn=true;
		kenBurnsTransitionOn=true;
		
		var mainArr = mediaObj[activeCategory].main;
		if(mainArr[getCounter()]){
			 var content = mainArr[getCounter()][0];
		 }else{
			//console.log('wait to load');
			if(usePreloader) showPreloader();
			loadRequest();
			return;
		 }
		
		var originalWidth = content.origWidth;
		var originalHeight = content.origHeight;
		//console.log('originalWidth, originalHeight = ', originalWidth, originalHeight);
		
		var data = $(categoryDataArr[getCounter()]);
		
		var scaleRises = false;
		
		//get data
		var startScale=parseFloat(data.attr('data-startScale')); 
		if(isNaN(startScale) || startScale==0){
			startScale=1;
			//startScale=randomMinMax(0.8,1.8);
		}
		
		var endScale=parseFloat(data.attr('data-endScale')); 
		if(isNaN(endScale) || endScale==0){
			endScale=1.5;
			//endScale=randomMinMax(0.8,1.8);
		}
		
		if(startScale < endScale) scaleRises = true;
		
		var startPosition=(data.attr('data-startPosition'))/*.toLowerCase()*/; 
		if(isBlank(startPosition) || !matchInArray(startPosition, _kenBurnsPositions)){
			startPosition = getRandomArrayValue(_kenBurnsPositions);
		}
		
		var endPosition=(data.attr('data-endPosition'))/*.toLowerCase()*/; 
		if(isBlank(endPosition) || !matchInArray(endPosition, _kenBurnsPositions)){
			endPosition = getRandomArrayValue(_kenBurnsPositions);
			while (endPosition == startPosition){//prevent same position, but only on random select in case user wants it
				//console.log(endPosition,startPosition);
				endPosition = getRandomArrayValue(_kenBurnsPositions);
				//console.log(endPosition,startPosition);
			}
		}
		
		var duration= parseFloat(data.attr('data-duration'));
		if(isNaN(duration) || duration==0){
			//data missing, generate your own
			duration=randomMinMax(3,7);
		}
		duration *= 1000;//miliseconds
		
		//console.log('startScale, endScale, startPosition, endPosition, duration = ', startScale, endScale, startPosition, endPosition, duration);
		
		var currentHolder = getEmptyHolder(true);
		currentHolder.css('opacity', 0);
		currentHolder.css('display', 'block');
		
		currentHolder.append(content);
		
		if(componentBgColor != undefined) componentHolder.css('background', componentBgColor);
		checkLink([content]);
		
		/*
		check if content is smaller than component size!
		*/
		
		//simulate scaleX/scaleY
		currentHolder.css('width', originalWidth * startScale + 'px');
		currentHolder.css('height', originalHeight * startScale + 'px');
		
		//read size
		var currentHolderWidth = parseInt(currentHolder.css('width'), 10);
		var currentHolderHeight= parseInt(currentHolder.css('height'), 10);
		
		var enlarger = 1.35;
		
		//check start dimensions, start with width first
		var factor = 0;
		if(currentHolderWidth < _componentWidth){
			factor= _componentWidth / currentHolderWidth;
			if(scaleRises){
				currentHolderWidth = _componentWidth;
				currentHolderHeight *= factor;
			}else{
				//if scale is dropping, makes start scale larger
				currentHolderWidth = _componentWidth * enlarger;
				currentHolderHeight *= (factor * enlarger);
			}
			
			//reapply size if changed
			currentHolder.css('width', currentHolderWidth + 'px');
			currentHolder.css('height', currentHolderHeight + 'px');
		}
	
		//read size again
		var currentHolderWidth = parseInt(currentHolder.css('width'), 10);
		var currentHolderHeight= parseInt(currentHolder.css('height'), 10);
		
		//check for height after (possible) width resize
		if(currentHolderHeight < _componentHeight){
			factor= _componentHeight / currentHolderHeight;
			if(scaleRises){
				currentHolderHeight = _componentHeight;
				currentHolderWidth *= factor;
			}else{
				currentHolderHeight = _componentHeight * enlarger;
				currentHolderWidth *= (factor * enlarger);
			}
			
			//reapply size if changed
			currentHolder.css('width', currentHolderWidth + 'px');
			currentHolder.css('height', currentHolderHeight + 'px');
		}
		
		var startX;
		var startY;
		var endX;
		var endY;
		
		var startWidth=parseInt(currentHolder.css('width'), 10);
		var startHeight=parseInt(currentHolder.css('height'), 10);
		//console.log('originalWidth, originalHeight, startWidth, startHeight = ', originalWidth, originalHeight, startWidth, startHeight);
		
		//we wont touch start size any more so we can calculate start position
		
		switch (startPosition) {
			case "tl" :
				startX=0;
				startY=0;
				break;
			case "tc" :
				startX=_componentWidth/2 - startWidth/2;
				startY=0;
				break;
			case "tr" :
				startX=_componentWidth - startWidth;
				startY=0;
				break;
			case "ml" :
				startX=0;
				startY=_componentHeight/2 -startHeight/2;
				break;
			case "mc" :
				startX=_componentWidth/2 - startWidth/2;
				startY=_componentHeight/2 -startHeight/2;
				break;
			case "mr" :
				startX=_componentWidth - startWidth;
				startY=_componentHeight/2 -startHeight/2;
				break;
			case "bl" :
				startX=0;
				startY=_componentHeight -startHeight;
				break;
			case "bc" :
				startX=_componentWidth/2 - startWidth/2;
				startY=_componentHeight -startHeight;
				break;
			case "br" :
				startX=_componentWidth - startWidth;
				startY=_componentHeight -startHeight;
				break;
		}
		
		var finalWidth = originalWidth * endScale;
		var finalHeight = originalHeight * endScale;
		
		//console.log( finalWidth, finalHeight);
		
		//check end dimensions, go by width first
		if(finalWidth < _componentWidth){
			factor= _componentWidth / finalWidth;
			if(scaleRises){
				finalWidth = _componentWidth * enlarger;
				finalHeight *= (factor * enlarger);
			}else{
				finalWidth = _componentWidth;
				finalHeight *= factor;
			}
		}
		
		//console.log(factor, finalWidth, finalHeight);
		
		//check for height after (possible) width resize
		if(finalHeight < _componentHeight){
			factor= _componentHeight / finalHeight;
			if(scaleRises){
				finalHeight = _componentHeight * enlarger;
				finalWidth *= (factor * enlarger);
			}else{
				finalHeight = _componentHeight;
				finalWidth *= factor;
			}
		}
		
		//console.log('finalWidth, finalHeight = ', finalWidth, finalHeight);
		
		//get end position for tween props
		var obj = getEndPositionKenBurns(endPosition, finalWidth, finalHeight);
		endX=obj.x;
		endY=obj.y;
		
		kbEndPosition=endPosition;//remember position for resize in transition off
		
		//console.log('startX,startY,endX,endY = ', startX,startY,endX,endY);
		
		//position on start
		currentHolder.css('left', startX);
		currentHolder.css('top', startY);
		
		//find timer delay for next image
		var fadeInTime =1000;
		var deductTime = 700;
		var delay=duration-deductTime;
		
		//check for smallest time! (fade before transition ends)
			
		if(usePreloader) hidePreloader();	
			
		if(slideshowOn){
			if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
			slideshowTimeoutID = setTimeout(transitionEndKB, delay);
		}
		
		currentHolder.animate({'opacity': 1},  {duration: fadeInTime, easing: "easeOutSine", queue: false, complete: function(){
			var otherHolder = getOtherHolder(currentHolder);
			//console.log('other before = ', otherHolder.children().size());
			$(otherHolder).stop().empty();
			otherHolder.css('display', 'none');
			//console.log('other after = ', otherHolder.children().size());
			mediaLoadedAction();
			kenBurnsTransitionOn=false;
			queMediaRequest=false;
			_thumbClick=false;//reset
		}});//fade in fast
		
		currentHolder.animate({'left': endX + 'px', 'top': endY+ 'px', 'width': finalWidth+ 'px', 'height': finalHeight+ 'px'},  {duration: duration, easing: "linear", queue: false, complete: function(){
			if(slideshowOn){
				transitionKenBurnsEnd(currentHolder);
			}else{
				transitionOn=false;
			}
		}});
	}

	function transitionKenBurnsEnd(currentHolder){
		//console.log("transitionKenBurnsEnd");
		$(currentHolder).empty();
		currentHolder.css('display', 'none');
		var otherHolder = getOtherHolder(currentHolder);
		transitionOn=false;
	}
	
	function getEndPositionKenBurns(endPosition, finalWidth, finalHeight){
		
		var o = {};
		
		switch (endPosition) {
			case "tl" :
				o.x=0;
				o.y=0;
				break;
			case "tc" :
				o.x=_componentWidth/2 - finalWidth / 2;
				o.y=0;
				break;
			case "tr" :
				o.x=_componentWidth - finalWidth;
				o.y=0;
				break;
			case "ml" :
				o.x=0;
				o.y=_componentHeight/2 -finalHeight/2;
				break;
			case "mc" :
				o.x=_componentWidth/2 - finalWidth / 2;
				o.y=_componentHeight/2 -finalHeight/2;
				break;
			case "mr" :
				o.x=_componentWidth - finalWidth;
				o.y=_componentHeight/2 -finalHeight/2;
				break;
			case "bl" :
				o.x=0;
				o.y=_componentHeight -finalHeight;
				break;
			case "bc" :
				o.x=_componentWidth/2 - finalWidth / 2;
				o.y=_componentHeight -finalHeight;
				break;
			case "br" :
				o.x=_componentWidth - finalWidth;
				o.y=_componentHeight -finalHeight;
				break;
		}
		
		return o;
	}
	
	/****************** HELPER FUNCTIONS **********************/
	
	//return opposite holder from given
	function getOtherHolder(holder) {
		var s;
		var name = holder.attr('data-title');
		if(name == '_holder1'){
			s = _holder2;
		}else{
			s = _holder1;
		}
		return s;
	}
	
	//swap children index, first sent child set to higher index
	function swapChildren(holder, holder2) {
		holder.css('zIndex', 1);
		holder2.css('zIndex', 0);
	}
	
	//return holder with no children
	function getEmptyHolder(empty) {
		var s;
		var s2;
		var numChildren = _holder1.children().size();
		
		if(empty){
			if(numChildren > 0){
				s = _holder2;
				s2 = _holder1;
			}else{
				s = _holder1;
				s2 = _holder2;
			}
		}else{
			if(numChildren > 0){
				s = _holder1;
				s2 = _holder2;
			}else{
				s = _holder2;
				s2 = _holder1;
			}
		}
		
		if( _transitionType=='KEN_BURNS'){
			//put next holder above current so we dont have to fade out current one with alpha, we just fade in next (for ken burns)
			if(parseInt(s.css('zIndex'), 10) < parseInt(s2.css('zIndex'), 10)){
				s.css('zIndex', 1);
				s2.css('zIndex', 0);
			}else{
				s.css('zIndex', 0);
				s2.css('zIndex', 1);
			}
		}
		
		return s;
	}
	
	 function retrieveObjectRatio( obj, w, h, _fitScreen ) {
			
		var o = new Object();
		
		var _paddingX = 0;
		var _paddingY = 0;
		
		var objWidth = obj.width();
		var objHeight = obj.height();
		
		var targetWidth = w;
		var targetHeight = h;
		
		var destinationRatio = (objWidth - _paddingX) / (objHeight - _paddingY);///destination ratio of an object
		var targetRatio = targetWidth / targetHeight;///target ratio of an object

		if (targetRatio < destinationRatio) {
			
			//console.log('targetRatio < destinationRatio 1');
			
			if (!_fitScreen) {//fullscreen
				o.height = ((objWidth - _paddingX) / targetWidth) * targetHeight;
				o.width = (objWidth - _paddingX);
			} else {//fitscreen
				o.width = ((objHeight - _paddingY) / targetHeight) * targetWidth;
				o.height = (objHeight - _paddingY);
			}
		} else if (targetRatio > destinationRatio) {
			
			//console.log('targetRatio > destinationRatio 2');
			
			if (_fitScreen) {//fitscreen
				o.height = ((objWidth - _paddingX) / targetWidth) * targetHeight;
				o.width = (objWidth - _paddingX);
			} else {//fullscreen
				o.width = ((objHeight - _paddingY) / targetHeight) * targetWidth;
				o.height = (objHeight - _paddingY);
			}
		} else {//fitscreen & fullscreen
			o.width = (objWidth - _paddingX);
			o.height = (objHeight - _paddingY);
		}
		
		return o;
	}
	
	//check for blank string
	function isBlank(str) {
		if (!str)
		{
			return true;
		}
		var result = false;
		if(str.replace(/\s/g,"") == ""){
			result = true;
		}
		return result;
	}
	
	function getRandomNotLast( array ) {//this function is responsible for selecting from which side the next image should appear. As its name suggest, its configurated the way that it doesnt repeat the same side twice in a row.
		var index = Math.floor(Math.random() * (array.length - 1));
		var value = array.splice(index, 1)[0];
		array.push(value);
		return value;
	}
	
	function getRandomArrayValue(array) {
		var randomIndex = Math.round(Math.random()*(array.length-1));
		return array[randomIndex];
	}
	
	//returns a random value between min and max
	function randomMinMax(min, max) {
		return Math.random() * max - min + min;
	}
	
	//check equality
	function matchInArray(item, arr) {
		var i=0;
		var len=arr.length;
		var match;
		var arrItem;
		for(i;i<len;i++){
			arrItem = arr[i];
			//console.log(item, arrItem);
			if(item == arrItem){
				match = true;
				break;
			}
		}
		//console.log(match);
		return match;
	}
	
	function getSlideshowDelay(){
		var nextDelay;
		var reserve= 3000;
		if(useGlobalDelay){
			nextDelay = slideshowTimeout > 0 ? slideshowTimeout : reserve;
		}else{
			if(currentData.attr('data-transitionDelay') != undefined){
				nextDelay = parseInt(currentData.attr('data-transitionDelay'), 10);
				//console.log('nextDelay = ', nextDelay);
			}else{
				nextDelay = slideshowTimeout > 0 ? slideshowTimeout : reserve;
			}
		}
		return nextDelay;
	}
	
	if(disableRightClick){
		_doc.bind("contextmenu",function(e){
			return false;
		});
	}
	
	function makeRandomList() {//make random set of numbers
		_randomArr = randomiseIndex(_playlistLength);
		//console.log(_randomArr);
	}
	
	function randomiseIndex(num){
		var arr = new Array(); 
		var randomArr = new Array();
		var i = 0;
		var j = 0;
		
		for (i; i < num; i++) {//first fill the ordered set of indexes
			arr[i] = i;
		}
		
		j = 0;
		for (j; j < num; j++) { //then randomize those indexes
			var randomIndex = Math.round(Math.random()*(arr.length-1));
			randomArr[j] = arr[randomIndex];
			arr.splice(randomIndex, 1);
		}
		return randomArr;
	}
	
	function getCounter() {
		//console.log('getCounter');
		var i;
		if(_randomPlay){
			if(!_thumbClick){
				i = _randomArr[_counter];
			}else{
				i = _counter;
			}
		}else{
			i = _counter;
		}
		return i;
	}
	
	function preventSelect(arr){
	
		$(arr).each(function() {           
		$(this).attr('unselectable', 'on')
			   .css({
				   '-moz-user-select':'none',
				   '-webkit-user-select':'none',
				   'user-select':'none'
			   })
			   .each(function() {
				   this.onselectstart = function() { return false; };
			   });
		});
	
	}	
	
	function showPreloader(){
		componentPreloader.css('opacity', 0);
		componentPreloader.css('display', 'block');
		componentPreloader.stop().animate({ 'opacity':1},  {duration: 500, easing: 'easeOutSine'});
	}
	
	function hidePreloader(){
		componentPreloader.stop().animate({ 'opacity':0},  {duration: 500, easing: 'easeOutSine', complete: function(){
			componentPreloader.css('display', 'none');
		}});
	}
	
	/*****************  CONTROLS *******************/
	
	function overControls(e){
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited) return;
		
		var currentTarget = e.currentTarget;
		var id = $(currentTarget).attr('class');
		
		if(id == 'controls_prev'){
			controlsPrevSrc.attr('src', settings.iconPath + 'prev_on.png');
		}
		else if(id == 'controls_toggle'){
			if(slideshowOn){
				controlsToggleSrc.attr('src', settings.iconPath + 'pause_on.png');
			}else{
				controlsToggleSrc.attr('src', settings.iconPath + 'play_on.png');
			}
		}
		else if(id == 'controls_next'){
			controlsNextSrc.attr('src', settings.iconPath + 'next_on.png');
		}
		else if(id == 'info_toggle'){
			infoToggleSrc.attr('src', settings.iconPath + 'info_on.png');
		}
		else if(id == 'link_toggle'){
			linkToggleSrc.attr('src', settings.iconPath + 'link_on.png');
		}
		else if(id == 'playlist_toggle'){
			if(!playlistOpened){
				playlistToggleSrc.attr('src', settings.iconPath + 'plus_on.png');
			}else{
				playlistToggleSrc.attr('src', settings.iconPath + 'minus_on.png');
			}
		}
	}
	
	function outControls(e){
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited) return;
		
		var currentTarget = e.currentTarget;
		var id = $(currentTarget).attr('class');
		
		if(id == 'controls_prev'){
			controlsPrevSrc.attr('src', settings.iconPath + 'prev_off.png');
		}
		else if(id == 'controls_toggle'){
			if(slideshowOn){
				controlsToggleSrc.attr('src', settings.iconPath + 'pause_off.png');
			}else{
				controlsToggleSrc.attr('src', settings.iconPath + 'play_off.png');
			}
		}
		else if(id == 'controls_next'){
			controlsNextSrc.attr('src', settings.iconPath + 'next_off.png');
		}
		else if(id == 'info_toggle'){
			infoToggleSrc.attr('src', settings.iconPath + 'info_off.png');
		}
		else if(id == 'link_toggle'){
			linkToggleSrc.attr('src', settings.iconPath + 'link_off.png');
		}
		else if(id == 'playlist_toggle'){
			if(!playlistOpened){
				playlistToggleSrc.attr('src', settings.iconPath + 'plus_off.png');
			}else{
				playlistToggleSrc.attr('src', settings.iconPath + 'minus_off.png');
			}
		}
	}
	
	function clickControls(e){
		//console.log('clickControls');
		if (!e) var e = window.event;
		if(e.cancelBubble) e.cancelBubble = true;
		else if (e.stopPropagation) e.stopPropagation();
		
		if(!componentInited) return;
		
		var currentTarget = e.currentTarget;
		var id = $(currentTarget).attr('class');
		
		if(id == 'controls_prev'){
			if(loadRequestPause || queMediaRequest) return;
			if(_transitionType != 'KEN_BURNS'){
				if(transitionOn){
					if(!queMediaRequest){
						queMediaRequestID='prev';
						queMediaRequest=true;	
					}
				}else{
					previousMedia();
				}
			}else{
				if(!kenBurnsTransitionOn && !queMediaRequest){
					queMediaRequestID='prev';
					queMediaRequest=true;	
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					transitionEndKB();
				}
			}
		}
		else if(id == 'controls_toggle'){
			queMediaRequest=false;//reset
			if(slideshowOn){
				if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
				slideshowOn=false;
				controlsToggleSrc.attr('src', settings.iconPath + 'play_on.png');
			}else{
				slideshowOn=true;
				controlsToggleSrc.attr('src', settings.iconPath + 'pause_on.png');
				if(_transitionType != 'KEN_BURNS'){
					if(!transitionOn){//otherwise its going to be triggered from end transition
						if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
						slideshowTimeoutID = setTimeout(nextMedia, getSlideshowDelay());
					}
				}else{
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					slideshowTimeoutID = setTimeout(nextMedia, getSlideshowDelay());
				}
			}
		}
		else if(id == 'controls_next'){
			if(loadRequestPause || queMediaRequest) return;
			if(_transitionType != 'KEN_BURNS'){
				if(transitionOn){
					if(!queMediaRequest){
						queMediaRequestID='next';
						queMediaRequest=true;	
					}
				}else{
					nextMedia();
				}
			}else{
				if(!kenBurnsTransitionOn && !queMediaRequest){
					queMediaRequestID='next';
					queMediaRequest=true;	
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					transitionEndKB();
				}
			}
		}
		else if(id == 'info_toggle'){
			if(!navigationActive) return;
			toggleInfo();
		}
		else if(id == 'link_toggle'){
			if(!navigationActive) return;
			toggleUrl();
		}
		else if(id == 'playlist_toggle'){
			togglePlaylist();
		}
		
		return false;
		
	}
	
	function triggerMedia(enable){
		//console.log('triggerMedia');
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		mediaUnloadedAction();
		if(enable) enableActiveThumb();
		disableActiveThumb();
		if(thumbRollover) positionThumbRollover(true);
		callTransition();
	}
	
	function nextMedia(){
		//console.log('nextMedia');
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		mediaUnloadedAction();
		enableActiveThumb();
		_counter++;
		if(_counter>_playlistLength-1){
			if(slideshowAdvancesToNextCategory){
				//load next category
				activeCategory++;
				if(activeCategory>_categoryLength-1) activeCategory = 0;
				//console.log(menuCounter,activeCategory);
				if(menuCounter + currentlyVisibleMenuItems-1<activeCategory){
					menuCounter =activeCategory;	
				}else if(activeCategory==0){
					menuCounter =activeCategory;	
				}
				cleanCategory();
				return;
			}else{
				_counter=0;	
			} 
		}
		disableActiveThumb();
		if(thumbRollover) positionThumbRollover(true);
		callTransition();
	}
	
	function previousMedia(){
		//console.log('previousMedia');
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		mediaUnloadedAction();
		enableActiveThumb();
		_counter--;
		if(_counter<0){
			if(slideshowAdvancesToNextCategory){
				//load previous category
				activeCategory--;
				if(activeCategory<0) activeCategory = _categoryLength-1;
				cleanCategory();
				return;
			}else{
				_counter=_playlistLength-1;	
			}
		} 
		disableActiveThumb();
		if(thumbRollover) positionThumbRollover(true);
		callTransition();
	}
	
	/***************** DATA *******************/
	
	function mediaLoadedAction(){
		
		//INFO
		if(useDescription){
			infoExist=false;//reset
			var data = $(categoryDataArr[getCounter()]);
			if(data.attr('data-description') != undefined){
				infoData = data.attr('data-description');
				infoExist = true;
				//console.log(infoData);
				
				infoHolder.css('width', 'auto');//reset
				infoHolder.html(infoData);
				//console.log(infoHolder.css('width'));
				if(parseInt(infoHolder.css('width'), 10)>maxDescriptionWidth){
					infoHolder.css('width', maxDescriptionWidth+'px');
				}
				
				//show info btn
				if(useDescription){
					infoToggleSrc.attr('src', settings.iconPath + 'info_off.png');
					info_toggle.css('opacity', 0);
					info_toggle.css('display', 'block');
					info_toggle.stop().animate({ 'opacity': 1},  {duration: 400, easing: 'easeOutSine'});
				}
				
				if(autoOpenDescription) toggleInfo();
			}
		}
		
		//LINK
		if(linkExist){
			//show link btn
			link_toggle.css('opacity',0);
			link_toggle.css('display','block');
			link_toggle.stop().animate({ 'opacity': 1},  {duration: 400, easing: 'easeOutSine'});
		}
		navigationActive=true;
	}
	
	function checkLink(arr){
		linkExist=false;//reset
		var data = $(categoryDataArr[getCounter()]);
		if(data.attr('data-link') != undefined){
			linkExist=true;
			_link=data.attr('data-link');
			if(data.attr('data-target') != undefined) _target=data.attr('data-target');
			if(!_target) _target="_blank";
			if(makeImageClickableForUrl){
				for(var i in arr){
					$(arr[i]).bind('click', toggleUrl);
					$(arr[i]).css('cursor','pointer');
				}
			}
			//console.log(_counter,_link,_target);
		}
	}
	
	function mediaUnloadedAction(){//hide info and link btns, show preloader
		navigationActive=false;
		if(useDescription){
			info_toggle.stop().animate({ 'opacity': 0},  {duration: 400, easing: 'easeOutSine', complete: function(){
				info_toggle.css('display', 'none');
			}});
			if(infoOpened){
				infoHolder.stop().animate({ 'opacity': 0},  {duration: 400, easing: 'easeOutSine', complete: function(){
					infoHolder.css('display', 'none');
				}});
				infoOpened=false;
			}
		}
		link_toggle.stop().animate({ 'opacity': 0},  {duration: 400, easing: 'easeOutSine', complete: function(){
			link_toggle.css('display', 'none');
		}});
	}
	
	function toggleInfo(){
		if(!infoOpened){
			infoHolder.css('opacity',0);
			infoHolder.css('display','block');
			infoHolder.stop().animate({ 'opacity': 1},  {duration: 400, easing: 'easeOutSine'});
			infoOpened=true;
		}else{
			infoHolder.stop().animate({ 'opacity': 0},  {duration: 400, easing: 'easeOutSine', complete: function(){
				infoHolder.css('display', 'none');
			}});
			infoOpened=false;
		}
	}
	
	function toggleUrl(){
		if(!_link) return;
		if(_target=='_parent'){
			window.location=_link;
		}else if(_target=='_blank'){
			var newWindow=window.open(_link, _target);
			if (window.focus) {newWindow.focus();}
		}
	}
	
	/***************** RESIZE *******************/
	
	if(!componentFixedSize){
		_window.resize(function() {
			 if(!componentInited || categoryTransitionOn) return false;
			 clearTimeout(this.id);
			 this.id = setTimeout(doneResizing, windowResizeInterval);
		});
	}
	
	function doneResizing(){
		//console.log('doneResizing');
		
		if(_transitionType == 'KEN_BURNS') lastComponentW = componentHolder.width();//remember before resize
		
		_componentWidth = parseInt( componentWrapper.css('width'), 10);
		_componentHeight = parseInt( componentWrapper.css('height'), 10);
		componentHolder.css('width', _componentWidth + 'px');
		componentHolder.css('height', _componentHeight + 'px');
		
		if(!transitionOn){
			//align media
			switch( _transitionType){
				case 'SLIDE':
					resizeSlide();
				break;	
				case 'SPLIT':
					resizeSplit();
				break;
				case 'REVEAL':
					resizeReveal();
				break;
				case 'KEN_BURNS':
					if(!kenBurnsTransitionOn) resizeKenBurns();
				break;
				case 'ALPHA':
					resizeAlpha();
				break;
				case 'ZOOM':
					resizeZoom();
				break;
			}
		}
		
		//align thumbs
		positionPlaylistHolder();
		getThumbHolderSize();
		
		//align menu
		if(!singleCategory) getMenuHolderSize();
	}
	
	function resizeKenBurns(){
		
		var w = _window.width();
		var h = _window.height();
		var currentHolder = getEmptyHolder(false);
		var w1 = currentHolder.width();
		var h1 = currentHolder.height();
		
		var newWidth = w/lastComponentW*w1;///get new media height on width side
		var ratioHeight=newWidth/w1;///get media height on width ratio
		
		currentHolder.css('width', newWidth+'px');
		currentHolder.css('height', h1*ratioHeight+'px');
		
		switch (kbEndPosition) {
			case "tl" :
				break;
			case "tc" :
				currentHolder.css('left', -newWidth/2+w/2+'px');
				break;
			case "tr" :
				currentHolder.css('left', -newWidth+w+'px');
				break;
			case "ml" :
				currentHolder.css('top', -currentHolder.height()/2+h/2+'px');
				break;
			case "mc" :
				currentHolder.css('top', -currentHolder.height()/2+h/2+'px');
				currentHolder.css('left', -newWidth/2+w/2+'px');
				break;
			case "mr" :
				currentHolder.css('top', -currentHolder.height()/2+h/2+'px');
				currentHolder.css('left', -newWidth+w+'px');
				break;
			case "bl" :
				currentHolder.css('top', -currentHolder.height()+h+'px');
				break;
			case "bc" :
				currentHolder.css('top', -currentHolder.height()+h+'px');
				currentHolder.css('left', -newWidth/2+w/2+'px');
				break;
			case "br" :
				currentHolder.css('top', -currentHolder.height()+h+'px');
				currentHolder.css('left', -newWidth+w+'px');
				break;
		}
		
		lastComponentW = w;//remember last size
	}
	
	function resizeSplit(){	
	
		 var currentHolder = getEmptyHolder(false);
		 //console.log(currentHolder.splitCase);
		 var splitCase = currentHolder.splitCase;
		 
		 var split1=$(currentHolder.children('div[data-title=split1]'));
		 var split2=$(currentHolder.children('div[data-title=split2]'));
		 var cut;
		 var content=split1.children('img');
		 var content2=split2.children('img');
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var w = originalWidth;
		 var h =originalHeight;
		
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
		
		content2.css('width', w + 'px');
		content2.css('height', h + 'px');
			 
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('left', 0 + 'px');
		currentHolder.css('top', 0 + 'px');
		 
		 if(splitCase == 'horizontalUpLeft' || splitCase == 'horizontalUpRight' || splitCase == 'horizontalSplit'){
			 
			split1.css('top', 0);
			split1.css('left', 0);
			split1.css('width', _componentWidth + 'px');
			split1.css('height', _componentHeight/2 + 'px');
			
			split2.css('top', _componentHeight/2 + 'px');
			split2.css('left', 0);
			split2.css('width', _componentWidth + 'px');
			split2.css('height', _componentHeight/2 + 'px');
			
			cut = (_componentHeight - h) / 2;
			
			//move second image inside
			content2.css('left', _componentWidth/2-w/2 + 'px');
			content2.css('top', -_componentHeight/2+ cut + 'px');
			 
		}else if(splitCase == 'verticalUpLeft' || splitCase == 'verticalDownLeft' || splitCase == 'verticalSplit'){
			 
			split1.css('top', 0);
			split1.css('left', 0);
			split1.css('width', _componentWidth /2 + 'px');
			split1.css('height', _componentHeight + 'px');
			
			split2.css('top', 0);
			split2.css('left', _componentWidth / 2 + 'px');
			split2.css('width', _componentWidth / 2 + 'px');
			split2.css('height', _componentHeight + 'px');
			
			//move second image inside
			content2.css('left', - w/2 + 'px');
			content2.css('top', _componentHeight/2- h/2 + 'px');
			 
		}
	}
	
	function resizeReveal(){	
	
		 var currentHolder = getEmptyHolder(false);
		 var content = currentHolder.children();
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
			 
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		
		currentHolder.css('left', 0 + 'px');
		currentHolder.css('top', 0 + 'px');
		
	}
	
	function resizeSlide(){	
	
		 var currentHolder = getEmptyHolder(false);
		 var content = currentHolder.children();
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		 
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		content.css('width', w + 'px');
		content.css('height', h + 'px');
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
			 
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
	
	}
	
	function resizeZoom(){	
		
		 var currentHolder = getEmptyHolder(false);
		 var content = currentHolder.children();
		 
		 var originalWidth = content[0].origWidth;
		 var originalHeight = content[0].origHeight;
		
		 var w = originalWidth;
		 var h =originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;	
		}
		
		currentHolder.css('width', _componentWidth + 'px');
		currentHolder.css('height', _componentHeight + 'px');
		currentHolder.css('left', 0);
		currentHolder.css('top', 0);
		 
		content.css('width', w + 'px');
		content.css('height', h + 'px');	
		content.css('left', _componentWidth/2-w/2 + 'px');
		content.css('top', _componentHeight/2-h/2 + 'px');
		
	}
	
	function resizeAlpha(){
		 
		 var currentHolder = getEmptyHolder(false);
		 var content = currentHolder.children()[0];
		 
		 var originalWidth = content.origWidth;
		 var originalHeight = content.origHeight;
		 
		 var w = originalWidth;
		 var h = originalHeight;
		 
		 if(forceImageFitMode || w > _componentWidth || h > _componentHeight){
			 var obj = retrieveObjectRatio(componentHolder, w, h, imageFitMode);
			 w = obj.width;			
			 h = obj.height;
		}
			
		currentHolder.css('width', w + 'px');
		currentHolder.css('height', h + 'px');
		currentHolder.css('left', _componentWidth/2-w/2 + 'px');
		currentHolder.css('top', _componentHeight/2-h/2 + 'px');
		
	}
	
	
	
	// ******************************** PUBLIC FUNCTIONS **************** //

	$.multiGallery.stopSlideshow = function() {
		if(!componentInited) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		slideshowOn=false;
		if(useSlideshowControls)controlsToggleSrc.attr('src', settings.iconPath + 'play_off.png');
	}
	
	$.multiGallery.startSlideshow = function() {
		if(!componentInited || slideshowOn) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		queMediaRequest=false;//reset
		if(slideshowOn){
			if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
			slideshowOn=false;
			controlsToggleSrc.attr('src', settings.iconPath + 'play_on.png');
		}else{
			slideshowOn=true;
			controlsToggleSrc.attr('src', settings.iconPath + 'pause_on.png');
			if(_transitionType != 'KEN_BURNS'){
				if(!transitionOn){//otherwise its going to be triggered from end transition
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					slideshowTimeoutID = setTimeout(nextMedia, getSlideshowDelay());
				}
			}else{
				if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
				slideshowTimeoutID = setTimeout(nextMedia, getSlideshowDelay());
			}
		}
	}
	
	$.multiGallery.togglePlaylistState = function() {
		if(!componentInited) return;
		if(playlistIndex == 'inside') togglePlaylist();
	}
	
	$.multiGallery.nextItem = function() {
		if(!componentInited) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		if(loadRequestPause || queMediaRequest) return;
		if(_transitionType != 'KEN_BURNS'){
			if(transitionOn){
				if(!queMediaRequest){
					queMediaRequestID='next';
					queMediaRequest=true;	
				}
			}else{
				nextMedia();
			}
		}else{
			if(!kenBurnsTransitionOn && !queMediaRequest){
				queMediaRequestID='next';
				queMediaRequest=true;	
				if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
				transitionEndKB();
			}
		}
	}
	
	$.multiGallery.previousItem = function() {
		if(!componentInited) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		if(loadRequestPause || queMediaRequest) return;
		if(_transitionType != 'KEN_BURNS'){
			if(transitionOn){
				if(!queMediaRequest){
					queMediaRequestID='prev';
					queMediaRequest=true;	
				}
			}else{
				previousMedia();
			}
		}else{
			if(!kenBurnsTransitionOn && !queMediaRequest){
				queMediaRequestID='prev';
				queMediaRequest=true;	
				if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
				transitionEndKB();
			}
		}
	}
	
	$.multiGallery.loadItem = function(num) {
		if(!componentInited || loadRequestPause) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		if(num<0)num=0;
		else if(num>_playlistLength-1)num=_playlistLength-1;
		if(num==_counter) return;//already opened
		_thumbClick=true;
		if(_transitionType != 'KEN_BURNS'){
			if(transitionOn){
				if(!queMediaRequest){
					queMediaRequestID=num;
					queMediaRequest=true;	
				}
			}else{
				enableActiveThumb();
				_counter = num;
				triggerMedia();	
			}
		}else{
			if(!kenBurnsTransitionOn){
				if(!queMediaRequest){
					queMediaRequestID=num;
					queMediaRequest=true;	
					if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
					transitionEndKB();
				}
			}
		}
	}
	
	$.multiGallery.loadCategory = function(num) {
		if(!componentInited) return;
		if(slideshowTimeoutID) clearTimeout(slideshowTimeoutID);
		if(num<0)num=0;
		else if(num>_categoryLength-1)num=_categoryLength-1;
		if(num==activeCategory) return;//already opened
		if(categoryTransitionOn){
			if(!queCategoryRequest){
				queCategoryRequestID=num;
				queCategoryRequest=true;	
			}
		}else{
			queCategoryRequest=false;	
			enableActiveMenuItem();
			activeCategory=num;
			disableActiveMenuItem();
			if(menuRollover) positionMenuRollover();
			cleanCategory();
		}
	}

	
	}
	
})(jQuery);






/*

The Boolean() type cast returns true when

the value is a string with at least one character,

a number other than 0, or

an object;

The Boolean() type cast returns false when

    the value is an empty string,
    the number 0,
    undefined, or
    null.

var b1 = Boolean("");              //false -- empty string
var b2 = Boolean("JavaScript");    //true -- non-empty string
var b3 = Boolean(100);             //true -- non-zero number
var b4 = Boolean(null);            //false -- null
var b5 = Boolean(0);               //false -- zero
var b6 = Boolean(new Object());    //true -- object



	  sliderWrapper.mousemove(function(e){
		 //console.log("X: " + e.pageX + " Y: " + e.pageY);
		 
		 var relativeX = e.pageX - this.offsetLeft;
    	var relativeY = e.pageY - this.offsetTop;
		 
		  //console.log("relativeX : " + relativeX + " relativeY : " + relativeY);
	  });
	

	
	$(document).bind('mousemove', function(e) {
     // console.log("X: " + e.pageX + " Y: " + e.pageY);
    });
   // $(document).trigger('mousemove');
	
	
	 //Create a new jQuery.Event object without the "new" operator.
 // var e = jQuery.Event("mousemove");

  // trigger an artificial click event
 // jQuery("body").trigger( e );
	

function typeOf(obj) {
	  if ( typeof(obj) == 'object' ){
		if (obj.length){
			return 'array';
		}else{
			return 'object';
		}
	  } else{
		return typeof(obj);
	  }
	}
	
	
	
	var overlayHolder = $("<div/>");
	overlayHolder.css('position', 'absolute');
	overlayHolder.css('top', 0);
	overlayHolder.css('left', 0);
	overlayHolder.css('width', _componentWidth + 'px');
	overlayHolder.css('height', _componentHeight + 'px');
	overlayHolder.css('zIndex', 999);
	overlayHolder.css('backgroundImage', 'url(data/pattern.png)');
	overlayHolder.css('backgroundRepeat', 'repeat');
	componentHolder.append(overlayHolder);
	
	
	
	$(_holder1, _holder2).hover(
    function () {
        $(this).data('title', $(this).attr('title'));
        $(this).removeAttr('title');
    },
    function () {
        $(this).attr('title', $(this).data('title'));
    });
	

*/

