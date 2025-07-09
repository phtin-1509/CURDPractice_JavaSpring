<!-- filepath: d:\Learn\Web\New folder\Shop-Project\src\main\webapp\WEB-INF\view\Admin\User\Create.jsp -->
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Detail User ${id}</title>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
            </head>

            <body>
                <div class="container mt-5">
                    <h2 class="mb-4">User Detail </h2>
                    <div class="card">
                        <div class="card-body">
                            <dl class="row">
                                <dt class="col-sm-3">ID</dt>
                                <dd class="col-sm-9">${user.id}</dd>

                                <dt class="col-sm-3">Email</dt>
                                <dd class="col-sm-9">${user.email}</dd>

                                <dt class="col-sm-3">Full Name</dt>
                                <dd class="col-sm-9">${user.fullName}</dd>

                                <dt class="col-sm-3">Address</dt>
                                <dd class="col-sm-9">${user.address}</dd>

                                <dt class="col-sm-3">Phone</dt>
                                <dd class="col-sm-9">${user.phone}</dd>
                            </dl>
                            <a href="${pageContext.request.contextPath}/admin/user" class="btn btn-secondary">Back to
                                List</a>
                        </div>
                    </div>
                </div>
            </body>

            </html>