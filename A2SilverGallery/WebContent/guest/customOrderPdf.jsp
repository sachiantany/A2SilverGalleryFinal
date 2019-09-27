<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="service.ICustomService"%>
<%@page import="model.CustomOrder"%>

<%@page import="service.CustomServiceImpl"%>
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

	ICustomService icustom1 = new CustomServiceImpl();
    List<CustomOrder> list1 = icustom1.readData();
 
	Iterator<CustomOrder> iter = list1.iterator();
%>
   

    <table id="exportTable" class="table table-hover">
        <thead>
            <tr>
                	<th>ID</th>
                 
                    <th>JewelaryType</th>
                    <th>GemStone</th>
                    <th>size</th>
                    <th>MetalWeight</th>
                    <th>description</th>
            </tr>
        </thead>
        <tbody>
        <% 	
		while(iter.hasNext()){
			CustomOrder O = new CustomOrder();
			O = iter.next();
				
					
		%>
            <tr>
               <td><%=O.getCID()%></td>
                    
					<td><%= O.getJType() %></td>
					<td><%= O.getGemStone() %></td>					
					<td><%= O.getFingerSize() %></td>
					<td><%= O.getMetalWeight() %></td>
					<td><%= O.getDescription() %></td>
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
                    	JewelaryType: { type: String},
                    	GemStone: { type: String},
                    	size: { type: String},                 
                    	MetalWeight: { type: String},
                    	description: { type: String}
                    	
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
                        { field: "JewelaryType", title: "Jewelary Type", width: 100 },
                        { field: "GemStone", title: "GemStone", width: 70 },
                        { field: "size", title: "size", width: 50 },
                        { field: "MetalWeight", title: "MetalWeight", width: 100 },
                        { field: "description", title: "description", width: 50 }
                        
                    ],
                    {
                        margins: {
                            top: 50,
                            left: 50
                        }
                    }
                );

                pdf.saveAs({
                    fileName: "CustomOrder_Report"
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
