$(document).ready(function() {	
	$("#siteNavMain>li:last").addClass("lastItem");
	
	$(".countdownClock").each(function(i) {
		//countdown($(this), i);
	});
	$(".shareBarRatings").each(function(e) {
		prepRatingSystem(e);
	});
	
	if(jCore.getUrlParam("tm") == "on") {
	
		initManager();
	
		initIndexManager();
		
		initTemplateHovers();
	
	}
});

/*************************************************
END OF DOC READY
*************************************************/
var timersArray = new Array();
function initTemplateHovers() {
	
	var allInfoBoxes = $(".templateInfo");
	$(".templateBlock").each(function(i) {
		var scope =$(this);
		thisPos = jCore.findPos(this);
		
		var thisTemplateInfo = $(".templateInfo:first", scope);
		thisTemplateInfo.css({"left": ($(".trigger:first",scope).width() + 25 + thisPos[0]), "top":thisPos[1]});
		$(".trigger", scope).bind("mouseover", function() {
			allInfoBoxes.fadeOut('fast');
			clearTimeout(timersArray[i]);
			showThisBox = function() {thisTemplateInfo.fadeIn('fast')}
			timersArray[i] = setTimeout("showThisBox()", 500);
		}).bind("mouseout", function() {
			clearTimeout(timersArray[i]);
			hideThisBox = function() {thisTemplateInfo.fadeOut('fast')}
			timersArray[i] = setTimeout("hideThisBox()", 500);
		});
		thisTemplateInfo.bind("mouseover", function() {
			clearTimeout(timersArray[i]);
		}).bind("mouseout", function() {
			clearTimeout(timersArray[i]);
			hideThisBox = function() {thisTemplateInfo.fadeOut('fast')}
			timersArray[i] = setTimeout("hideThisBox()", 500);
		});
	});
}
function initIndexManager() {
	$(".addLayout").bind("click", function() {
		var el = $(this).attr("rel");
		showOverlay(el);
		return false;
	});
	$(".addLayoutForm, .addTemplateForm").bind("submit", function() {
		var str = $(this).serialize();
		var loc = $(this).attr("action");
		$.getJSON(loc, str);
		hideOverlay();
		window.location.reload();
		return false;
	});
	
	$(".removeIcon").bind("click", function() {
		var loc = this.toString();
		$.getJSON(loc);
		window.location.reload();
		return false;
	});
}
/*************************************************
LIGHTBOX FUNCTIONALITY
*************************************************/
var doc = $(document);
var win = $(window);
var overlay = $("#overlay");
var dialogBox = $("#dialog");
function showOverlay(el) {
	overlay.height(doc.height()).width(doc.width()).show().bind("click", function() {hideOverlay();});
	$("form", dialogBox).hide();
	$("."+el).show();
	showDialog();
	win.bind("resize", function() {overlayResize();});
}
function overlayResize() {
	showDialog();
	overlay.hide().height(doc.height()).width(doc.width()).show();
}
function hideOverlay() {
	overlay.hide().unbind("click");
	dialogBox.hide();
	win.unbind("resize");
}
function showDialog(el) {
	newLeft = (win.width()/2) - (dialogBox.width() / 2);
	newTop = (win.height()/2) - (dialogBox.height() / 2) + win.scrollTop();
	//actionButton.bind("click", function() { callback(); hideOverlay(); return false;});
	dialogBox.css({"top":newTop,"left":newLeft}).show();
}
/*************************************************
LIGHTBOX FUNCTIONALITY END
*************************************************/
function initManager() {
	$("#navCol, #mainContentCol1, #mainContentCol2, #mainContentCol3, #mainContentCol4, #mainContentCol5, #mainContentCol6, #mainContentColExtra").each(function() {
		var filename = location.pathname.substring(location.pathname.lastIndexOf('/')+1).replace(".thtml","").replace("-", "%20");
		var mainScope = $(this);
		$(".deleteButtonWrap", mainScope).each(function(i) {
			var scope = $(this);
			var removeUrl = "/Handlers/RemoveModule.ajax?template="+filename+"&column="+mainScope.attr("id")+"&position="+i;
			var thisDeleteButton = $(".deleteModuleButton", scope);
			thisDeleteButton.click(function() {
				
				$.getJSON(removeUrl, function() {
					scope.remove();			  
				});
				return false;
			});
			scope.hover(
				function() {
					thisDeleteButton.fadeIn("fast");
				},
				function() {
					thisDeleteButton.fadeOut("fast");							 
				}
			);
			
		});
		
		
		$(this).css("position", "relative");
		var layoutClass = $("body").attr("class");
		$(this).append("<a href='/handlers/ListModules.ajax?column=" + this.id + "&layoutClass="+layoutClass+"' rel='" + this.id + "' onclick='return addItemList(this)' class='addButton'>ADD</a>");
	}).hover(
		function() {
			scope = this;
			$(".addButton", scope).fadeIn("fast");
		},
		function() {
			scope = this;
			$(".addButton", scope).fadeOut("fast");
			$(".addListBox", scope).remove();
		}
	);//.sortable({ cursor: 'move', cancel: '.addButton, .addListBox, .deleteModuleButton, input, textarea, select', handle: '.moduleWrap, .adModule', snapMode:'outer', forceHelperSize: true, revert: true});
}
function addItemList(el) {
	var filename = location.pathname.substring(location.pathname.lastIndexOf('/')+1).replace(".thtml","");
	
	$.ajax({
		url: el.href,
		dataType: "json",
		success: function(data) {
			$(el).next("addListBox").hide();
			tempSource=new Array();
			tempSource.push("<ul class='addListBox'>");
			for(i in data) {
			    tempSource.push("<li><a onclick='return addModule(this);' href='/Handlers/AddModule.ajax?template=" + filename.replace(".thtml", "") + "&module=" + data[i].name + "&moduleFile=" + data[i].filename + "&column=" + $(el).attr("rel") + "' rel='" + $(el).attr("rel") + "'>" + data[i].name + "</a></li>");
			}
			tempSource.push("</ul>");
			$(el).after(tempSource.join(""));
		}
	});
	return false;
}
function addModule(el) {
	var container = $(el).attr("rel");
	$.ajax({
		url: el.href,
		dataType: "json",
		success: function(data) {
			if(data.processed == true) {
				window.location.reload();
				//$(".deleteButtonWrap:last","#"+container).after(data.Result);
				//$(".addListBox","#"+container).remove();
			}
		}
	});
	return false;
}