<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery-1.5.js"></script>
<script>
	function countChar(val) {
		var len = val.value.length;
		if (len >= 500) {
			val.value = val.value.substring(0, 500);
		} else {
			$('#charNum').text(500 - len);
		}
	};
</script>
</head>

<body>
	<textarea onkeyup="countChar(this)"></textarea>
	<div id="charNum"></div>
</body>

</html>