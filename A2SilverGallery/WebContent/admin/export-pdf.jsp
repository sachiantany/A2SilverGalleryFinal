<!DOCTYPE html>
<%@page import="service.AdminServiceImpl"%>
<%@page import="model.AdminProduct"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="service.IAdminService"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>Stock Report - PDF</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/css/bootstrap.min.css" crossorigin="anonymous">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css" crossorigin="anonymous">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.3.7/js/tether.min.js" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.5/js/bootstrap.min.js" crossorigin="anonymous"></script>
	
    
</head>
<body>
<h1 class="text-sm-center">A2 Silver Gallery</h1>
<h2 class="text-sm-center">Stock Report</h2>

<div class="container">
    <%
	IAdminService iadmin= new AdminServiceImpl();
    List<AdminProduct> list = iadmin.readData();
 
	Iterator<AdminProduct> iter = list.iterator();
%>
   

    <table id="exportTable" class="table table-hover">
        <thead>
            <tr>
                	<th>ID</th>                    
                    <th>Name</th>
                    <th>categories</th>
                    <th>quantity</th>
                    <th>settings</th>
                    <th>metal</th>
                    <th>stone</th>                
                    <th>price</th>
            </tr>
        </thead>
        <tbody>
        <% 	
			while(iter.hasNext()){
				AdminProduct ap = new AdminProduct();
				ap = iter.next();
					
		%>
            <tr>
                <td><%= ap.getPID() %></td>
                <td><%= ap.getProductName() %></td>
                <td><%= ap.getProductCat() %></td>
                <td><%= ap.getQuantity() %></td>
                <td><%= ap.getSettingWith() %></td>
                <td><%= ap.getMetalWeight() %></td>
                <td><%= ap.getStoneWeight() %></td>
                <td><%= ap.getPrice() %></td>
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
                    	Name: { type: String},
                    	categories: { type: String},
                    	quantity: { type: String},                 
                    	settings: { type: String},
                    	metal: { type: String},
                    	stone: { type: String},
                    	price: { type: String}                
                        
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
                    	
                        { field: "ID", title: "JID", width: 30 },
                        { field: "Name", title: "Item Name", width: 100 },
                        { field: "categories", title: "Type", width: 70 },
                        { field: "quantity", title: "Quantity", width: 50 },
                        { field: "settings", title: "Settings with", width: 100 },
                        { field: "metal", title: "Metal Weight", width: 50 },
                        { field: "stone", title: "Stone Weight", width: 50 },
                        { field: "price", title: "Price (Rs.)", width: 60 }
                        
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "Stock_Report"
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
