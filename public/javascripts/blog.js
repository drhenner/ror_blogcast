jQuery(document).ready(function($) {
	/*-----------------------------------------------------------
						COMMENTS
	-----------------------------------------------------------*/

	//Select comment input on focus
	var commentDefaultText = "Remember, your comment represents you. Let's add value. Some XHTML is welcomed (strong em blockquote code).";
	
	$("#new_comment_canvas input[type=text], #new_comment_canvas textarea").focus(function() {
		var defaultText = $(this).val();
		if(defaultText === "Name" || defaultText === "Email"|| defaultText === "Website" || defaultText === commentDefaultText) {
			$(this).select();
		}
	});
	
	//Don't submit comment or preview comment when no comment is given	
	$("#new_comment_canvas input[type=submit]").live('click', function (event) {
		if($("#comment_content").val() === "" || $("#comment_content").length === 0 || $("#comment_content").val() === commentDefaultText) {
			event.preventDefault();
			return false;
		}
	});
	
	//Preview a comment
	$("#preview_comment_link").live('click', function (event) {
		if($("#comment_content").val() === "" || $("#comment_content").length === 0 || $("#comment_content").val() === commentDefaultText) {
			event.preventDefault();
			return false;
		} else {
			$.post($(this).attr('href'), $("#new_comment").serialize(), null, "script");
			event.preventDefault();
			return false;
		}
	});	
	
	$("#edit_comment_link").click(function (event) {
		event.preventDefault();
		$("#comment_preview_canvas").hide();
		$("#new_comment_canvas").show();
	});
	
	/*-----------------------------------------------------------
						WMD
	-----------------------------------------------------------*/

	if( $("#wmd-container textarea").length ) {
		
		$("#wmd-container textarea").elastic();
		
		if($("#wmd-container textarea").focus()) {
			$("#wmd-container textarea").TextAreaResizer(); 
		}
	}

	/*-----------------------------------------------------------
						POST CREATE AND DRAFT EDIT
	-----------------------------------------------------------*/
	
	editPost = function() {
		var title = $("#title-container input").val();
		
		$(".post h2 a").text(title);
		
		//1st: Removes all non alphanumeric characters from the string.
		//2nd: No more than one of the separator in a row.
		//3rd: Remove leading/trailing separator.
		var url = "/1234-" + title.replace(/[^a-zA-Z0-9]+/g, "-").replace(/-{2,}/g, "-").replace(/^-|-$/g, "").toLowerCase();
		
		$("#title-container p").text(url);
	}
	
	$("#title-container").live("keyup paste focus", function() {
		editPost();
	});
	
	//Only need to load the title in the url preview for the edit draft page
	if($(".draft-title-container").length) {
		editPost();
	}
	
	/*-----------------------------------------------------------
						HIGHLIGHT.JS
	-----------------------------------------------------------*/
	
	hljs.tabReplace = '    ';
	hljs.initHighlightingOnLoad();
	
	//Turn on code highlight for post and draft previews
	$("#wmd-preview").live('click', function() {
		$("pre code").each(function(i, e) {hljs.highlightBlock(e, '    ')});
	});
}); //document.ready