$(document).ready(function(){

	var host = "";
	$.getJSON("../hv/config.json",function(data, status){
		host = data.host;
	});
	
	window.location.hash = "statistics";
	$(".dashboard-content").hide();
	$("#statistics").show();
	$("#statistics-btn").attr("class", "active");
	$.getJSON(host+"/health/hv/stats.php",function(data, status){
		var doughnutData = [
			{
				value: data[0][0]/1,
				color:"#5bc0de"
			},
			{
				value : data[0][1]-data[0][0],
				color : "#f0ad4e"
			}

		];
		new Chart(document.getElementById("doughnut").getContext("2d")).Doughnut(doughnutData);
					
		var ls = [];
		var d = [];
					
		for(i=0; i<data[1].length; ++i)
		{
			ls.push(data[1][i].Chr_Condition);
			d.push(data[1][i].Total);
		}
		var barChartData = {
						
			labels : ls,
			datasets : [
				{
					fillColor : "#59BBBB",
					data : d
				}
			]

		};
		new Chart(document.getElementById("bar").getContext("2d")).Bar(barChartData);
					
					
		ls = [];
		d = [];
					
		for(i=0; i<data[2].length; ++i)
		{
			ls.push(data[2][i].Label);
			d.push(data[2][i].Total);
		}
					
		var lineChartData = {
			labels : ls,
			datasets : [
				{
					fillColor : "#2A98D8",
					strokeColor : "#A5CCE2",
					pointColor : "#A5CCE2",
					pointStrokeColor : "#fff",
					data : d
				}
			]
										
		};
		new Chart(document.getElementById("line").getContext("2d")).Line(lineChartData);


				
	});
	
	$("#add-card-btn").click(function(e){
		window.location.hash = "add-new-card";
		e.preventDefault();
	});
	$("#statistics-btn").click(function(e){
		window.location.hash = "statistics";
		e.preventDefault();
	});
	
	$(window).on('hashchange', function(){
		
			if(location.hash == "#add-new-card")
			{
				$(".dashboard-content").hide();
				$("#hc-form #form-b").hide();
				$("#add-new-card").show();
				$("#add-card-btn").attr("class", "active");
				$("#statistics-btn").attr("class", "");
			}
			else if(location.hash == "#statistics")
			{
				$(".dashboard-content").hide();
				$("#statistics").show();
				$("#statistics-btn").attr("class", "active");
				$("#add-card-btn").attr("class", "");
				
			}
		
	});
	
	$("#go-btn").click(function(){
		checkAadhar();
	});
	
	$("#aadhar").keypress(function(e){	
		if(e.which == 13)
			checkAadhar();
	});
	
	
	$("#addhc-btn").click(function(){
		addcard();
	});

	$("#contact").keypress(function(e){	
		if(e.which == 13)
			addcard();
	});	

	function alert(message, type){
		switch(type){
			case "success" : $(".alert").attr("class","alert alert-success");
							 break;
			
			case "info" : $(".alert").attr("class","alert alert-info");
							 break;
							 
			case "warning" : $(".alert").attr("class","alert alert-warning");
							 break;
			
			case "danger" : $(".alert").attr("class","alert alert-danger");
							 break;
		}
		
		$(".alert").html(message);
		
		$(".alert").show();
		$(".alert").fadeOut(5000,function(){
			$(".alert").html("");
		});
		
	}
	
	function checkAadhar()
	{
		var aadhar = $("#hc-form #aadhar").val();
			$.getJSON(host+"/health/hv/aadhar.php", {'id': aadhar} ,function(data, status){
				
				if(data[0] == "success")
				{
					$("#hc-form #form-a").hide();
					$("#hc-form").prepend(
						"<div id=\"info\"><h4><strong>Name: </strong>"+ data[1].name +"</br><strong>Address: </strong>"+ data[1].street + ", " + data[1].vtc + ", " + data[1].subdist + ", " + data[1].district + ", " + data[1].state + ", " + data[1].pincode  + "<br></h4></div>"
					);
					$("#hc-form #form-b").show();
				}
				else if(data[0] == "exists")
				{
					$("#hc-form #form-a").hide();
					$("#hc-form").prepend(
						"<div id=\"info\"><h4><strong>Name: </strong>"+ data[1].name +"</br><strong>Address: </strong>"+ data[1].street + ", " + data[1].vtc + ", " + data[1].subdist + ", " + data[1].district + ", " + data[1].state + ", " + data[1].pincode  + "<br></h4></div>"                        
					);
					alert("Healthcard for " + data[1].name + " is already created.", "warning")
				}
				else
					alert("Operation Failed. Check Aadhar Number and try again.", "danger")
					
			});
	}
	
	function addcard(){
		var aadhar = $("#hc-form #aadhar").val();
		var name = $("#hc-form #name").val();
		var bgroup = $("#hc-form #bgroup").val();
		var contact = $("#hc-form #contact").val();
		
		if(aadhar =="" || name=="" || bgroup=="" || contact=="")
		{
			alert("Some of the fields are empty.", "warning");
			return;
		}
		
		var formdata = {'aadhar' : aadhar, 'name' : name, 'bgroup' : bgroup, 'contact' : contact};
		alert(formdata.aadhar);
		
		$.get(host+"/health/hv/addcard.php", formdata ,function(data, status){
		
			if(data == "success")
			{
				alert("Card created successfully.", "success")
			}
			else
			{
				alert("Operation Failed. Please try again.", "danger");
			}
			
		});
	}


});