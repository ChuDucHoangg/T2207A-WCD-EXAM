<%@ page import="com.entities.Employee" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="card text-center">
        <div class="card-header">
            <h1 class="mb-2 mt-2">ABC Company's Employee List</h1>
        </div>
        <div class="row mt-3">
            <div class="col-sm-2">
            <a href="create-employee" class="float-end btn btn-info">Add Employee</a>
            </div>
            <div class="col-sm-6">
            </div>
            <div class="col-sm-4">
                <form class="row" method="post" action="searchEmployee">
                    <div class="col-auto">
                        <label for="inputPassword2" class="visually-hidden">Search: </label>
                        <input type="text" name="searchKeyword" class="form-control" id="inputPassword2" placeholder="search">
                    </div>
                    <div class="col-auto">
                        <button type="submit" class="btn btn-primary mb-3">Search</button>
                    </div>
                </form>
            </div>
        </div>
        <div class="card-footer text-body-secondary">
        <table class="table mb-5">
        <thead>
        <tr>
            <th scope="col">Employee Id</th>
            <th scope="col">Employee Name</th>
            <th scope="col">Email</th>
            <th scope="col">Birthday</th>
            <th scope="col">Phone Number</th>
            <th scope="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <% for (Employee s: (List<Employee>) request.getAttribute("employees")) { %>
        <tr>
            <th scope="row"><%= s.getEmployeeId() %></th>
            <td><%= s.getEmployeeName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getBirthday() %></td>
            <td><%= s.getPhoneNumber() %></td>
            <td>
                <button class="btn btn-warning"><a class="text-light" href="edit-employee?id=<%= s.getEmployeeId() %>">Edit</a></button>
                <button class="btn btn-danger"><a class="text-light" onclick="deleteEmployee('<%= s.getEmployeeId() %>')" href="javascript:void(0);">Delete</a></button>
            </td>
        </tr>
        <% } %>

        </tbody>
    </table>
        </div>
</div>
</div>
<script>
    function deleteEmployee(id) {
        if (confirm("Are you sure?")){
            var url = `list-employee?id=` + id;
            fetch(url, {
                method: 'DELETE'
            }).then(response => {
                if (response.ok) {
                    if (confirm("Reload page?")) {
                        window.location.reload();
                    }
                } else {
                    throw new Error('Failed to delete employee');
                }
            }).catch(error => {
                alert(error.message);
            });
        }
    }
</script>
</body>
</html>
