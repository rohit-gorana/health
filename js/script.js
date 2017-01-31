$(document).ready(function(){
	var host = "";
	$.getJSON("../hv/config.json",function(data, status){
		host = data.host;
	});
	
$("#submit-btn").click(function(){	
	getInfo();	
});

$("#inputId").keypress(function(e){	
	if(e.which == 13)
		getInfo();
});

function getInfo(){

	var Healthid = $("#inputId").val();
	/*$.get("http://localhost:8080/health/hv/info.php",{'id': Healthid} ,function(data, status){
		alert(data);
	});*/
	
	$(".welcome").hide();
	$(".loader").fadeIn(1000);
	$.getJSON(host+"/health/hv/info.php", {'id': Healthid} ,function(data, status){
		$("#card .col-xs-9").html("<h4>Name: "+data[0].Name+"</h4><h4>ID: "+data[0].id+"</h4><h4>Blood Group: "+data[0].Blood_Group+"</h4><h4>Emergency Contact: "+data[0].Emg_Contact);
		
		if(data[1].Health_Status != "Healthy")
		{
			$("#curr-condition div:first").attr("class", "panel panel-danger");
		}
		$("#curr-condition .panel-body").html("<h1>"+ data[1].Health_Status+"</h1>"+"<p><strong>Since: </strong>"+data[1].Initial_Date);
		
		var chrCond = data[2];
		for(var i=(chrCond.length-1); i>=0; --i )
		{
			$("#chr-condition tbody").prepend(
				"<tr><td>" + (i+1) +"</td>"+
				"<td>"+ chrCond[i].Chr_Condition +"</td>"+
				"<td>"+ chrCond[i].Status +"</td></tr>"	
			);
		}
		
		var history = data[3];
		for(var i=(history.length-1); i>=0; --i )
		{
			var frm = history[i].Start_Date.split("-");
			var to = history[i].End_Date.split("-");
			frm = new Date(frm[0],frm[1], frm[2]);
			to = new Date(to[0], to[1], to[2]);
			var duration = (to - frm)/1000/60/60/24; 
			$("#history tbody").prepend(
				"<tr><td>" + (i+1) +"</td>"+
				"<td>"+ history[i].Start_Date +"</td>"+
				"<td>"+ history[i].Diagnosis +"</td>"+
				"<td>"+ duration+" Days" +"</td>"+
				"<td>"+ history[i].Result +"</td>"+
				"<td>"+ history[i].Notes +"</td></tr>"	
			);
		}
		
		var allergies = data[4];
		for(var i=(allergies.length-1); i>=0; --i )
		{
			$("#allergies ul").prepend(
				"<li class=\"list-group-item\">" + allergies[i].Allergy + "</li>"
			);
		}
		$(".loader").fadeOut(1000, function(){
			$(".content").show();
		});
		
		
		
	});
}

$("#done-btn").click(function(){
	location.reload();
});
	
});