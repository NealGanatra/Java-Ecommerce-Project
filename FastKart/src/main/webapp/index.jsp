<%@page import="com.learn.mycart.helper.Helper"%>
<%@page import="com.learn.mycart.dao.CategoryDao"%>
<%@page import="com.learn.mycart.dao.ProductDao"%>
<%@page import="com.learn.mycart.entities.Product"%>
<%@page import="com.learn.mycart.entities.Category"%>
<%@page import="com.learn.mycart.helper.FactoryProvider"%>
<%@page import="java.util.List"%>
<html>
<head>
<%@include file="components/common_css_js.jsp"%>
<%@include file="components/navbar.jsp" %>

</head>
<body>
<div class="container">
<div class="row mt-3">
<div class="col-md-2">
<h2>Categories</h2>
<div class="list-group">
  <a href="index.jsp?category=all" id="cvalueall" class="list-group-item list-group-item-action" aria-current="true">
    All Products
  </a>
<%
String cat="";
//if(request.getParameter("category")!=null){
cat=request.getParameter("category");
//}
CategoryDao cDao=new CategoryDao(FactoryProvider.getFactory());
List<Category> cList=cDao.getCategories();
ProductDao pdao=new ProductDao(FactoryProvider.getFactory());
List<Product> pList=pdao.getProducts();

	if(cat==null || cat.equals("all")){
	pList=pdao.getProducts();
}
else{
	int cId=Integer.parseInt(cat.trim());
	pList=pdao.getProductsByCategoryId(cId);
}

for(Category c:cList){%>

  <a href="index.jsp?category=<%=c.getCategoryId() %>"  id="cvalue<%=c.getCategoryId()  %>" class="list-group-item list-group-item-action" onclick="makeActive(<%=c.getCategoryId()  %>);"><%=c.getCategoryTitle() %></a>

<%} %>
  
</div>

<%@include file="components/common_modal.jsp" %>
</div>
<div class="col-md-8">
<div class="row mt-3">
<div class="card-group">
<%
if(pList.size()==0)
out.println("No Item in this category");
for(Product p:pList){%>
<div class="card-blocks">
  <div class="card mt-5 mx-3">
    <img src="Images/products/<%=p.getpPhoto() %>" class="card-img-top" style="max-height:200px;max-width:200px;"  alt="image">
    <div class="card-body">
      <h5 class="card-title"><%=p.getpName() %></h5>
      <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
      <p class="card-text"><small class="text-muted">MRP:&#8377; <%=p.getpPrice()%></small></p>
    </div>
     <div class="card-footer">
  <button class="btn btn-primary" onclick="add_to_cart(<%=p.getpId()%>,'<%=p.getpName()%>',<%=pdao.getDiscountedPrice(p)%>)">Add to Cart</button>
  <button class="btn btn-outline-success" >&#8377;<%=pdao.getDiscountedPrice(p) %><span class="text-secondary discount-label">&nbsp<%=p.getpPrice() %>, <%=p.getpDiscount()%>%</span></button>
  </div>
  </div>
  </div>



<%} %>
</div>


</div>
</div>
</div>
</div>
</body>
</html>
