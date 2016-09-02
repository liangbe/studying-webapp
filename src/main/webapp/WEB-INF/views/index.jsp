<%--
  Created by IntelliJ IDEA.
  User: LIANGBE
  Date: 8/11/2016
  Time: 3:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.1.0.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<script>
    $(document).ready(function(){

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
debugger;
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
    });
</script>
<body>
<form >
    <input name="name" id="name"/>
    <button  id="submit" type="button">提交</button>
</form>

<table border="1" id="grid">
    <tr id="header">
        <th id="id">No.</th>
        <th id="category">Category</th>
        <th id="code">Code</th>
        <th id="description">Description</th>
        <th id="sequence">Sequence</th>
    </tr>

</table>
</body>
</html>
