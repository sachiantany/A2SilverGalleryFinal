<!DOCTYPE html>
<%@page import="service.StaffBusServiceImp"%>
<%@page import="model.StaffBusService"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="service.IStaffBusService"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Transport Report - PDF</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" crossorigin="anonymous"></script>
	
    
</head>
<body>
<h1 class="text-sm-center">A2 Silver Gallery</h1>
<h2 class="text-sm-center">Transport Report</h2>

<div class="container">
    <%
	IStaffBusService iStaffBusService= new StaffBusServiceImp();
    List<StaffBusService> list = iStaffBusService.getStaffBusService();
 
	Iterator<StaffBusService> iter = list.iterator();
%>
   

    <table id="exportTable" class="table table-hover">
        <thead>
            <tr>
                	<th>ID</th>
	 				<th>EmployeeID</th>
	 				<th>Name</th>
	 				<th>BusNo</th>
	 				<th>Destination</th>
	 				<th>Cost</th>
            </tr>
        </thead>
        <tbody>
        <% 	
			while(iter.hasNext()){
				StaffBusService sbs = new StaffBusService();
				sbs = iter.next();
					
		%>
            <tr>
                <td><%= sbs.getBID() %></td>
                <td><%= sbs.getStaffID() %></td>
                <td><%= sbs.getEname() %></td>
                <td><%= sbs.getBusNo() %></td>
                <td><%= sbs.getDestination() %></td>
                <td><%= sbs.getCost() %></td>
                
            </tr>
             <% 
                  
			}
	
			%>
        </tbody>
    </table>
    <button id="exportButton" class="btn btn-lg btn-danger clearfix"><span class="fa fa-file-pdf-o"></span> Export to PDF</button>
</div>

<!-- you need to include the shieldui css and js assets in order for the components to work -->
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/shieldui-all.min.js"></script>
<script type="text/javascript" src="http://www.shieldui.com/shared/components/latest/js/jszip.min.js"></script>

<script type="text/javascript">
    jQuery(function ($) {
        $("#exportButton").click(function () {
            // parse the HTML table element having an id=exportTable
            var dataSource = shield.DataSource.create({
                data: "#exportTable",
                schema: {
                    type: "table",
                    fields: {
                    	ID: { type: String },
                    	EmployeeID: {type : String},
                    	Name: {type : String},
                    	BusNo: { type: String},
                    	Destination: { type: String},
                    	Cost: { type: String}               
                        
                    }
                }
            });

            // when parsing is done, export the data to PDF
            dataSource.read().then(function (data) {
                var pdf = new shield.exp.PDFDocument({
                    author: "PrepBootstrap",
                    created: new Date()
                });

                pdf.addPage("a4", "portrait");

                
                pdf.table(
                    50,
                    50,
                    data,
                    [
                    	
                        { field: "ID", title: "BID", width: 50 },
                        { field: "EmployeeID", title: "Staff ID", width: 50 },
                        { field: "Name", title: "Staff Member Name", width: 150 },
                        { field: "BusNo", title: "Bus Number", width: 70 },
                        { field: "Destination", title: "Destination", width: 100 },
                        { field: "Cost", title: "Cost", width: 60 }
                        
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "Transport_Report"
                });
            });
        });
    });
</script>

<style>
    #exportButton {
        border-radius: 0;
    }
</style>


</body>
</html>
