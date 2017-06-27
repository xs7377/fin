<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
    <meta name="author" content="David Bushell">
    <link rel="stylesheet" href="css/pikaday.css">
    <link rel="stylesheet" href="css/site.css">
    <script type="text/javascript">
    	$(function(){
    		$("#Check_In").val($("#val_datePicker").val());
    	});
    </script>
    <style type="text/css">
}
    
    </style>
</head>
<body>
    	<input type="text" id="Check_In" name="period" class="check_input a-text" style="width: 150px;" placeholder="month/date" readonly="readonly" onchange="change_out()">
    <script src="pikaday.js"></script>
    <script>
    var day = Number($("#minBook").attr("class"));
    var start = new Date();
    var max = new Date();
    max = max.setDate(start.getDate()+7);
    start= start.setDate(start.getDate()+1);
        startPicker = new Pikaday({
            field: document.getElementById('Check_In'),
            minDate: new Date(start),
            maxDate: new Date(max),
            position: 'bottom left',
            onSelect: function() {
                startDate = this.getDate();
                var date = new Date(startDate);
                var today = ""+date.getFullYear()+"-"+(date.getMonth()+1)+"-"+date.getDate();
                $("#Check_In").val(today.trim());
                date.setDate(date.getDate()+day);
                updateStartDate(date);
            }
        }),
        _startDate = startPicker.getDate(),
        _endDate = endPicker.getDate();

        if (_startDate) {
            startDate = _startDate;
            updateStartDate();
        }

        if (_endDate) {
            endDate = _endDate;
            updateEndDate();
        }
    </script>
</body>
</html>
