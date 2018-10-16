<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	assignSelectFilter('#tempFilterLeft', '#tempLeft');
	assignSelectFilter('#tempFilterRight', '#tempRight');
});

function addData() {
	var ls = ['ABC intDEF',
			'XYZ intABC',
			'qwerty',
			'abcdefgh',
			'blah blah intDUMMY',
			'blah blah hello',
			'hello int'];
	$.each(ls, function(key, value) {   
	     $('#tempLeft')
	         .append($("<option></option>")
	                    .attr("value",key)
	                    .text(value)); 
	});
}

function assignSelectFilter(compID, selectID) {
	$(compID).keyup(function() {
		if ($(this).val().length >= 2) {
			var rex = new RegExp($(this).val(), 'i');
			$(selectID + ' option ').hide().addClass("filterHidden");
			$(selectID + ' option').filter(function() {
				return rex.test($(this).text());
			}).show().removeClass("filterHidden");

			$(selectID + ' option').filter(function() {
				return rex.test($(this).text());
			}).show();
		} else {
			$(selectID + ' option').show().removeClass("filterHidden");
		}
	});
}

function pushSelectedToRight(pushObj) {
	
	pushObj = $(pushObj);
	var leftBox = $("#tempLeft");
	var rightBox = $("#tempRight");
	if(leftBox.find("option:selected").length > 0){
		var tmp = leftBox.find("option:selected");
		console.log('tmp1 > ' + tmp);
		// tmp = tmp.find("display:block");
		tmp.each(function(){
	        if($(this).css("display")=="block"){
		    	console.log('--- > ' + $(this).val());
		    	rightBox.append($(this));
		    }
	    });
		console.log('tmp2 > ' + tmp);
		//rightBox.append(tmp);
		rightBox.find("option").removeAttr("selected");
	}
	else{
		alert("Please select atleast one item to move");
	}

}

function pushSelectedToLeft(pushObj) {
	
	pushObj = $(pushObj);
	var leftBox = $("#tempLeft");
	var rightBox = $("#tempRight");
	if(rightBox.find("option:selected").length > 0){
		leftBox.append(rightBox.find("option:selected"));
		leftBox.find("option").removeAttr("selected");
	}
	else{
		alert("Please select atleast one item to move");
	}

}
</script>
</head>
<body>

	<div>
		<h5>Select Left Item</h5>
		<select multiple="multiple" id="tempLeft" style="width: 50%; height: 40%">
		</select> 
		<br/>
		<input type="text" id="tempFilterLeft"
			placeholder="Type to Filter Product Family (minimum 2 characters)" style="width: 50%" />
	</div>
	
	<div>
		<button id="button" onclick="addData();">Populate Data</button>
	</div>
	
	<div>
		<button onclick="pushSelectedToRight(this)"> &gt; </button>
	</div>
	<div>
		<button onclick="pushSelectedToLeft(this)"> &lt; </button>
	</div>
	
	<div>
		<h5>Select Right Item</h5>
		<select multiple="multiple" id="tempRight" style="width: 50%; height: 40%">
		</select> 
		<br/>
		<input type="text" id="tempFilterRight"
			placeholder="Type to Filter Product Family (minimum 2 characters)" style="width: 50%" />
	</div>

</body>
</html>
