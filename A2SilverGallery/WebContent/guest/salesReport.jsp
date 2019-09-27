<!DOCTYPE html>
<%@page import="service.SalesServiceImp"%>
<%@page import="model.Sales"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="service.ISalesService"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Sales Report</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" crossorigin="anonymous"></script>
	
    
</head>
<body>
<h1 class="text-sm-center">A2 Silver Gallery</h1>
<h2 class="text-sm-center">Sales Report</h2>

<div class="container">
    <%
	ISalesService iSalesService= new SalesServiceImp();
    List<Sales> list = iSalesService.getSales();
 
	Iterator<Sales> iter = list.iterator();
%>
   

    <table id="exportTable" class="table table-hover">
        <thead>
            <tr>
                	<th>salesID</th>
	 				<th>formName</th>
	 				<th>staffID</th>
	 				<th>subTotal</th>
	 				<th>discount</th>
	 				<th>totalPrice</th>
	 				
            </tr>
        </thead>
        <tbody>
        <% 	
			while(iter.hasNext()){
				Sales sbs = new Sales();
				sbs = iter.next();
					
		%>
            <tr>
                <td><%= sbs.getSalesID() %></td>
                <td><%= sbs.getCustomerName() %></td>
                <td><%= sbs.getStaffID() %></td>
                <td><%= sbs.getAmount() %></td>
                <td><%= sbs.getDiscount() %></td>
                <td><%= sbs.getTotal() %></td>
                
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
                    	salesID: { type: String },
                    	formName: {type : String},
                    	staffID: {type : String},
                    	subTotal: { type: String},
                    	discount: { type: String},
                    	totalPrice: { type: String}               
                        
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
                    	
                        { field: "salesID", title: "Sales ID", width: 50 },
                        { field: "formName", title: "Customer Name", width: 150 },
                        { field: "staffID", title: "Staff ID", width: 50 },
                        { field: "subTotal", title: "Sub Total", width: 100 },
                        { field: "discount", title: "Discount", width: 50 },
                        { field: "totalPrice", title: "Total Price", width: 100 }
                        
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "Sales_Report"
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
