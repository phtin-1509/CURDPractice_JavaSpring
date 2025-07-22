<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>User List</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="/WEB-INF/view/admin/layout/header.jsp" />
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <jsp:include page="/WEB-INF/view/admin/layout/sidebar.jsp" />
                    </div>
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container mt-5">
                                <div class="d-flex justify-content-between align-items-center mb-4">
                                    <h2 class="mb-0">User List</h2>
                                    <a href="${pageContext.request.contextPath}/admin/user/create"
                                        class="btn btn-primary">
                                        Add User
                                    </a>
                                </div>
                                <table class="table table-bordered table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>#</th>
                                            <th>Email</th>
                                            <th>Full Name</th>
                                            <th>Address</th>
                                            <th>Phone</th>
                                            <th>Role</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" items="${users}" varStatus="status">
                                            <tr>
                                                <td>${user.id}</td>
                                                <td>${user.email}</td>
                                                <td>${user.fullName}</td>
                                                <td>${user.address}</td>
                                                <td>${user.role.name}</td>
                                                <td>${user.phone}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/user/delete/${user.id}"
                                                        class="btn btn-danger btn-sm">Delete</a>
                                                    <a href="${pageContext.request.contextPath}/admin/user/update/${user.id}"
                                                        class="btn btn-warning btn-sm">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/user/${user.id}"
                                                        class="btn btn-info btn-sm">View</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </main>
                        <!-- footer -->
                        <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                    </div>
                </div>
            </body>

            </html>