<%@ page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Product Management</title>
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
                                    <h2 class="mb-0">Product List</h2>
                                    <a href="/admin/product/create" class="btn btn-primary">
                                        Add New Product
                                    </a>
                                </div>
                                <table class="table table-bordered table-striped">
                                    <thead class="table-dark">
                                        <tr>
                                            <th>ID</th>
                                            <th>Name</th>
                                            <th>Price</th>
                                            <th>Quantity</th>
                                            <th>Factory</th>
                                            <th>Target</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="product" items="${products}">
                                            <tr>
                                                <td>${product.id}</td>
                                                <td>${product.name}</td>
                                                <td>${product.price}</td>
                                                <td>${product.quantity}</td>
                                                <td>${product.factory}</td>
                                                <td>${product.target}</td>
                                                <td>
                                                    <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}"
                                                        class="btn btn-danger btn-sm">Delete</a>
                                                    <a href="${pageContext.request.contextPath}/admin/product/update/${product.id}"
                                                        class="btn btn-warning btn-sm">Edit</a>
                                                    <a href="${pageContext.request.contextPath}/admin/product/${product.id}"
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