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
                                        <a href="${pageContext.request.contextPath}/admin/user"
                                            class="btn btn-secondary">Back to
                                            List</a>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!-- footer -->
                        <jsp:include page="/WEB-INF/view/admin/layout/footer.jsp" />
                    </div>
                </div>
            </body>

            </html>