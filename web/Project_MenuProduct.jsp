<%@page import="entity.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.DAOCategory"%>
<%
    DAOCategory daoCate = new DAOCategory();
    ArrayList<Category> listCate = daoCate.getCategory();
    int th1 = 0;
    int th2 = 0;
    int th3 = 0;
    int th4 = 0;
    int th5 = 0;
    int th6 = 0;
    int th7 = 0;
    
    for(Category cate: listCate){
        if(cate.getCateName().equals("GUCCI")){
            th1 = cate.getCateID();
        }
        if(cate.getCateName().equals("ELIZABETH TAYLOR")){
            th2 = cate.getCateID();
        }
        if(cate.getCateName().equals("GIVENCHY")){
            th3 = cate.getCateID();
        }
        if(cate.getCateName().equals("BOSS")){
            th4 = cate.getCateID();
        }
        if(cate.getCateName().equals("CALVIN KLEIN")){
            th5 = cate.getCateID();
        }
        if(cate.getCateName().equals("DAVIDOFF")){
            th6 = cate.getCateID();
        }
        if(cate.getCateName().equals("LACOSTE")){
            th7 = cate.getCateID();
        }
    }
%>
<div class="slide hi-slide">
    <div class="hi-prev"></div>
    <div class="hi-next"></div>
    <ul>
        <li><a href="ControllerCart?cateId=<%=th1%>"><img src="img/th1.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th2%>"><img src="img/th2.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th3%>"><img src="img/th3.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th4%>"><img src="img/th4.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th5%>"><img src="img/th5.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th6%>"><img src="img/th6.jpg"/></a></li>
        <li><a href="ControllerCart?cateId=<%=th7%>"><img src="img/th7.jpg"/></a></li>
    </ul>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/jquery.hislide.js"></script>
<script>
    $('.slide').hiSlide();
</script>
