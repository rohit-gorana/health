$(document).ready(function(){


	var host = $("#host");
	var server = $("#server");
	var username = $("#username");
	var password = $("#password");
	
	var address = "config.json";
	
	$.getJSON(address ,function(data, status){
		host.val(data.host);
		server.val(data.server);
		username.val(data.username);
		password.val(data.password);
	});
	
	$("#update-btn").click(function(){
		var address = $("#host").val() + "/health/hv/config.php";
	
		var requestdata = {'host': host.val(), 'server': server.val(), 'username': username.val(), 'password': password.val()};
		$.get(address, requestdata ,function(data, status){
	
			alert(data);
	
		});
	});
});