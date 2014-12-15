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

        .handsontable .currentRow {
            background-color: #E7E8EF;
        }
        
        .handsontable .currentCol {
            background-color: #F9F9FB;
        }

        .chosenCell
        {
            overflow: visible !important;
            width: 200px !important;
        }

    </style>

    <script type="text/javascript">
        
        function s4() {
            return Math.floor((1 + Math.random()) * 0x10000)
                       .toString(16)
                       .substring(1);
        }
        function guid() {
            return s4() + s4() + '-' + s4() + '-' + s4() + '-' +
                   s4() + '-' + s4() + s4() + s4();
        };


        $(document).ready(function ()
        {
            console.log("ready");
            //$(".chosen-select").chosen({ disable_search_threshold: 10 });
            // $(".chosen-select").chosen();



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

            // https://handsontable.com/demo/renderers_html.html
            // http://harvesthq.github.io/chosen/options.html
            var chosenRenderer = function (instance, td, row, col, prop, value, cellProperties)
            {
                var ele = document.getElementById("dbtypes");
                
                var ele2 = ele.cloneNode(true);
                ele2.id = guid();
                ele2.style.display = "block";
                // console.log("ele2");

                
                

                if(td.cellIndex > -1)
                {
                    console.log("tdi: " + td.cellIndex);
                    console.log("tri: " + td.parentElement.rowIndex);
                    //console.log("index: " + td.cellIndex);
                    //console.log("index: " + td.cellIndex);
                    // var tr = td.parentElement;
                    // console.log("tr: " + tr.index);
                }
                

                // var escaped = Handsontable.helper.stringify(value);
                //ele2.value = "uuid"; 
                ele2.value = value; // option value
                
                // instance.setDataAtCell(0, 0, 'new value');


                var last;
                while (last = td.lastChild)
                    td.removeChild(last);
                
                // var answer = select.options[select.selectedIndex].value;
                // var answer = select.options[select.selectedIndex].text;


                // GetSelectedValue
                // var element = document.getElementById("elementId");
                // var value = element.options[e.selectedIndex].value;
                // var text = element.options[e.selectedIndex].text;


                // ​document.getElementById('sel').value = 'bike';​​​​​​​​​​
                // td.style.width = "200px";
                // td.style.height = "100px";
                td.appendChild(ele2);
                $(td).addClass("chosenCell");


                $(ele2).chosen();

                //escaped = strip_tags(escaped, '<em><b><strong><a><big>'); //be sure you only allow certain HTML tags to avoid XSS threats (you should also remove unwanted HTML attributes)
                //td.innerHTML = escaped;
                return td;
            }

            //////////////////////////////////////////////////////////////
            
            // that.getCellMeta(r, c).readOnly = atLeastOneReadOnly ? false : true;

            var example2 = document.getElementById('example2');
            window.hot2 = new Handsontable(example2,{
              data: getCarData(),
              startRows: 7,
              startCols: 4,
              minSpareRows: 1,
                // file:///D:/Stefan.Steiger/Documents/Downloads/Handson/Handson/handsontable-master/demo/contextmenu.html
              //contextMenu: true,
              contextMenu: ['row_above', 'row_below', 'remove_row', 'undo', 'redo', 'make_read_only'],
              currentRowClassName: 'currentRow',
              currentColClassName: 'currentCol',
              colHeaders: ["Column name", "Type", "Length", "Precision", "Scale", "NN", "AI", "UC"],
              // colWidths: [120, 50, 60],
              columnSorting: true,
              columns: [
                {
                  data: "columnname"
                  //1nd column is simple text, no special options here
                },
                {
                     data: "type"
                    , type: 'text' // http://handsontable.com/demo/renderers.html
                    ,renderer: chosenRenderer
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
            // handsontable('setDataAtCell', row, col, value)
            
        });
        
        
        function getCarData() {
            return [
            {
                columnname: "COL_UID",
                type: "uuid",
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'yes',
                unique: 'yes'
            },
            {
                columnname: "FirstName",
                type: 2,
                length: 255,
                precision: 19,
                scale: 5,
                notnull: true,
                autoincrement: 'no',
                unique: 'no'
            },
            {
                columnname: "LastName",
                type: 3,
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


        window.chosenUnhighlightCallback = function (ele)
        {
            console.log(ele);
            // console.log(e.target);
        }


        window.chosenHighlightCallback = function ($chosentarget)
        {
            return;
            //console.log(this);
            console.log($chosentarget);
            var $chosendiv = $chosentarget.parent().parent().parent();
            var strChosenId = $chosendiv.attr("id");
            console.log(strChosenId);
            // console.log(e.target);
        }


        function lalala(obj)
        {
            console.log(obj);
            var td = obj.parentElement;
            var tr = td.parentElement;

            var value = obj.options[obj.selectedIndex].value;
            
            //window.hot2.setDataAtCell(tr.rowIndex -1, td.cellIndex -1, 'new value');
            window.hot2.setDataAtCell(tr.rowIndex - 1, td.cellIndex, value);
        }

    </script>





    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        
        <!--
        <select class="chosen-select" data-placeholder="Choose a Country...">
            -->
         

        <select id="dbtypes" data-placeholder="Choose a Type..." class="chosen-select" style="width: 200px; display: none;" onchange="lalala(this);" >
            <option value=""></option>
            
            <optgroup label="uuid">
                <option value="uuid">uuid</option>
            </optgroup>
		    
            <optgroup label="Integer-Types">
                <!--
                <option selected="selected">bigint</option>
                -->
		        
		        <option value="2">tinyint</option>
                <option value="3">smallint</option>
                <option value="4">int</option>
                <option value="5">bigint</option>
                <option value="6">float</option>
                <option value="7">double</option>
                <option value="8">money</option>
                <option value="9">decimal</option>
                <option value="10">numeric</option>
                
                <option value="binary">binary</option>
                <option value="varbinary">varbinary</option>
                <option value="sql_variant">sql_variant</option>
            </optgroup>
	    </select>
        
        <div>
            <div id="example1grid" class="dataTable"></div>    
            
            
            <div id="example2" class="dataTable"></div>    
        </div>
        <div style="clear: both; height: 30px;"></div>

        <script type="text/javascript" >

            function lol()
            {

                //3. OR, get the instance using $.data and then call method on the instance (obsolete)
                // var ht = $('#example2').data('handsontable');
                //var ht = hot2.data('handsontable');
                //var hot3 = $('#example2').data('handsontable');
                //var hot3 = $('#example2').handsontable('getInstance');
                var instance = $('#example2').handsontable('getInstance');
                // instance.setDataAtCell(0, 0, 'new value');
                //local hook (has same effect as a callback)
                //$('#example2').handsontable('getInstance').


                console.log(instance);
                //hot3.setDataAtCell(0, 0, 'new value');
                //console.log(ht);
                //ht.setDataAtCell(0, 0, 'new value');
                //$('#example2').handsontable('setDataAtCell', 03, 4, '666');
            }


        </script>


        <input type="button" value="hello" onclick="lol();" />

    </form>
</body>
</html>
