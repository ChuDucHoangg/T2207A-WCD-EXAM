<%@ page import="com.entities.Employee" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <% Employee employee = (Employee) request.getAttribute("employee"); %>
    <form action="edit-employee?id=<%= employee.getEmployeeId() %>" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail4" class="form-label">Employee Id</label>
            <input type="text" name="id" value="<%= employee.getEmployeeId() %>" class="form-control" id="exampleInputEmail4" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Employee Name</label>
            <input type="text" name="name" value="<%= employee.getEmployeeName() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword2" class="form-label">Email</label>
            <input type="email" name="email" value="<%= employee.getEmail() %>" class="form-control" id="exampleInputPassword2">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword5" class="form-label">BirthDay</label>
            <input type="date" name="birthday" value="<%= employee.getBirthday() %>" class="form-control" id="exampleInputPassword5">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword3" class="form-label">Phone</label>
            <input type="text" name="phone" value="<%= employee.getPhoneNumber() %>" class="form-control" id="exampleInputPassword3">
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
</html>
