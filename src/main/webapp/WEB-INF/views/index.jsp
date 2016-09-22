<%--
  Created by IntelliJ IDEA.
  User: LIANGBE
  Date: 8/11/2016
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.0.js"></script>--%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/ext-all-debug.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/theme-neptune-all-debug.css">
<html>
<head>
    <title>Title</title>
</head>
<script>
    Ext.onReady(function(){

        Ext.define('customIdentifier', {
            extend: 'Ext.data.identifier.Generator',
            alias: 'data.identifier.customIdentifier',
            generate: function () {
                return null;
            }
        });
        Ext.define('TypeSupp', {
            extend: 'Ext.data.Model',
            idProperty: 'id',  // this is the default value (for clarity)
            identifier: {
                type: 'customIdentifier',
            },
            fields: [
//                { name: 'id' ,type: 'int',allowNull :true},
                { name: 'category', type: 'auto' },
                { name: 'code', type: 'auto' },
                { name: 'description',  type: 'string' },
                { name: 'sequence',type: 'int' }
            ],


        });
        var store = new Ext.data.JsonStore({
            // store configs
            storeId: 'myStore',
            autoLoad:true,
            model:'TypeSupp',
            proxy: {
                type: 'ajax',
                url: "${pageContext.request.contextPath }/myController",
                reader: {
                    type: 'json',
                    totalProperty: 'totalElements',
                    rootProperty: 'content'
                }
            },


            //alternatively, a Model name can be given (see Ext.data.Store for an example)

        });
        Ext.create('Ext.grid.Panel', {
            title: 'Simpsons',
            store: store,
            id:'myGridPanel',
            columns: [
                {
                    text: 'Category',
                    dataIndex: 'category',
                    flex:1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                },
                {
                    text: 'Code',
                    dataIndex: 'code',
                    flex:1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }

                },
                {
                    text: 'Description',
                    dataIndex: 'description',
                    flex:1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                },
                {
                    text: 'Sequence',
                    dataIndex: 'sequence',
                    flex:1,
                    editor: {
                        xtype: 'textfield',
                        allowBlank: false
                    }
                }
            ],
            height: 500,
            width: 1000,
            plugins: {
                ptype: 'rowediting',
                id: 'myplugin'
            },
            dockedItems : [
                {
                    xtype : 'toolbar',
                    dock : 'top',
                    items : [
                        {
                            xtype : 'button',
                            id : 'addBtn',
                            text : 'Add'
                        },
                    ],

                },
            ],
            renderTo: Ext.getBody()
        });
        Ext.getCmp("addBtn").on("click",function(btn){
            store.insert ( 0 ,  Ext.create('TypeSupp', {}) );

            Ext.getCmp("myGridPanel").getPlugin ( 'myplugin').startEdit(0,0);
        });
        Ext.getCmp("myGridPanel").on("edit",function( editor , context ){
           var record= context.record;
            debugger;

        });

    });
    <%--    $(document).ready(function(){

        $("#submit").click(function(){
            var inputName=$("#name").val();

            debugger;
            $.ajax({
                url:"${pageContext.request.contextPath }/myController",
                dataType: 'json',
                async:false,
                data: {"name":inputName},
                type: "GET",
                success: function(req) {
                    debugger;
                    var tr=null;
                    $.each(req, function (i, item) {
                        tr = "<tr><td>"+item.id+"</td>" +
                                "<td>"+item.category+"</td>" +
                                "<td>"+item.code+"</td>" +
                                "<td>"+item.description+"</td>" +
                                "<td>"+item.sequence+"</td></tr>";
                        debugger;
                        $("#grid").append(tr);
                    })


                },
                error: function() {
                    debugger;
                }

            });

        });
   });--%>
</script>
<body>
<%--<form >--%>
<%--<input name="name" id="name"/>--%>
<%--<button  id="submit" type="button">提交</button>--%>
<%--</form>--%>

<%--<table border="1" id="grid">--%>
<%--<tr id="header">--%>
<%--<th id="id">No.</th>--%>
<%--<th id="category">Category</th>--%>
<%--<th id="code">Code</th>--%>
<%--<th id="description">Description</th>--%>
<%--<th id="sequence">Sequence</th>--%>
<%--</tr>--%>

<%--</table>--%>
</body>
</html>
