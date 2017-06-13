$(document).ready(function() {
	$('a[data-confirm]').click(function(ev) {
		var href = $(this).attr('href');
		if (!$('#dataConfirmModal').length) {
			$('body').append('<div id="dataConfirmModal" class="modal" role="dialog" aria-labelledby="dataConfirmLabel" aria-hidden="true"><div class="modal-header" id="modal-style"><button type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button><h3 id="dataConfirmLabel">Please Confirm</h3></div><div class="modal-body" id="modal-style2"></div><div class="modal-footer"  id="modal-style1"><button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button><a class="btn btn-primary" id="dataConfirmOK">OK</a></div></div>');
		} 
		$('#dataConfirmModal').find('.modal-body').text($(this).attr('data-confirm'));
		$('#dataConfirmOK').attr('href', href);
		$('#dataConfirmModal').modal({show:true});
		document.getElementById("modal-style").style.background = "white";
		document.getElementById("modal-style1").style.background = "white";
		document.getElementById("modal-style2").style.background = "white";
		return false;
	});
});
