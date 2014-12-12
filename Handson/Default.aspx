<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Handson._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <script src="Scripts/jquery-2.1.1.min.js" type="text/javascript"></script>
    <script src="Scripts/chosen.jquery.js" type="text/javascript"></script>
    <script src="Scripts/handsontable.js" type="text/javascript"></script>
    <script src="Scripts/numeral.js" type="text/javascript"></script>
    
    <link rel="stylesheet" media="all" href="Scripts/chosen.min.css" />
    <link rel="stylesheet" media="all" href="Scripts/handsontable.full.css" />

    <style type="text/css" media="all">

    </style>

    <script type="text/javascript">
        
        $(document).ready(function ()
        {
            console.log("ready");
            //$(".chosen-select").chosen({ disable_search_threshold: 10 });
            $(".chosen-select").chosen();



            //var data = [
            //  ["uuid", 10, 11, 12, true, true, "yes"],
            //  ["int", 20, 11, 14, true, true, "no"],
            //  ["varchar", 30, 15, 12, true, true, true]
            //];



      //      var config = {
      //          data: data,
      //          // minRows: 5,
      //          // minCols: 6,
      //          minSpareRows: 1,
      //          autoWrapRow: true,
      //          // colHeaders: true,
      //          colHeaders: ["ColumnName", "Type", "Length", "Precisison", "Radix", "Not Null", "AI", "UC"],
      //          contextMenu: true,
      //          columns: [
	  //  		    {
	  //  		      data: "columnname"
	  //  		      //1nd column is simple text, no special options here
	  //  		    },
	  //  		    {
	  //  		      data: "type"
	  //  		      //1nd column is simple text, no special options here
	  //  		    },
	  //  		    {
	  //  		      data: "length",
	  //  		      type: 'numeric'
	  //  		    },
	  //  		    {
	  //  		      data: "precision",
	  //  		      type: 'numeric'
	  //  		    },
	  //  		    {
	  //  		      data: "radix",
	  //  		      type: 'numeric'
	  //  		    },
	  //  		    {
	  //  		      data: "notnull",
	  //  		      type: "checkbox"
	  //  		    },
	  //  		    {
	  //  		      data: "ai",
	  //  		      type: "checkbox"
	  //  		    },
	  //  		    {
	  //  		      data: "uc",
	  //  		      type: "checkbox",
      //checkedTemplate: 'yes',
      //uncheckedTemplate: 'no'
				      
	  //  		    }
	  //  	  ]
      //      };

            // $("#handsontableDivID").handsontable(config);

            //$("#example1grid").handsontable(config);

            //$("#example1grid").handsontable("loadData", data);

            //$('th').css('background-color', 'red');


            //var data = $("#example1grid").handsontable('getInstance').getData();
            //console.log(data);


            //////////////////////////////////////////////////////////////

            var example2 = document.getElementById('example2');
            var hot2 = new Handsontable(example2,{
              data: getCarData(),
              startRows: 7,
              startCols: 4,
              colHeaders: ["Column name", "Type", "Length", "Precision", "Scale", "NN", "AI", "UC"],
              // colWidths: [120, 50, 60],
              columnSorting: true,
              columns: [
                {
                  data: "columnname"
                  //1nd column is simple text, no special options here
                },
                {
                    data: "type",
                    type: 'numeric'
                },
                 {
                     data: "length",
                     type: 'numeric'
                 },
                {
                    data: "precision",
                    type: 'numeric'
                },
                {
                    data: "scale",
                    type: 'numeric'
                },
                {
                    data: "notnull",
                    type: "checkbox"
                }
                ,
                {
                    data: "autoincrement",
                    type: "checkbox",
                    checkedTemplate: 'yes',
                    uncheckedTemplate: 'no'
                }
                ,
                {
                    data: "unique",
                    type: "checkbox",
                    checkedTemplate: 'yes',
                    uncheckedTemplate: 'no'
                }
              ]
            });




            console.log("/ready");
        });
        
        
        function getCarData() {
            return [
            {
                columnname: "COL_UID",
                type: 255,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'yes',
                unique: 'yes'
            },
            {
                columnname: "FirstName",
                type: 255,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'no',
                unique: 'no'
            },
            {
                columnname: "LastName",
                type: 255,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'no',
                unique: 'no'
            },
            {
                columnname: "Company", 
                type: 255,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'no',
                unique: 'no'
            },
            {
                columnname: "Email", 
                type: 255,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'no',
                unique: 'no'
            }
            ];
        }
    </script>


    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <!--
        <select class="chosen-select" data-placeholder="Choose a Country...">
            -->
        <select data-placeholder="Choose a Type..." class="chosen-select" style="width: 200px;" >
            <option value=""></option>
            
            <optgroup label="uuid">
                <option>uuid</option>
            </optgroup>
		    
            <optgroup label="Integer-Types">
                <!--
                <option selected="selected">bigint</option>
                -->
		        <option>int</option>
		        <option>smallint</option>
            </optgroup>
	    </select>
        

        <div>
            <div id="example1grid" class="dataTable"></div>    
            
            
            <div id="example2" class="dataTable"></div>    
        </div>

        <input type="button" value="hello" onclick="" />

    </form>
</body>
</html>
