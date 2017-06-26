<%@ page language="java" import="java.util.*" contentType="text/html;charset=utf-8"%>
<!DOCTYPE html>
	<html lang="en">
	<head>
		<title></title>
			<style type="text/css">
* { margin:0; padding:0;}
.i1{width:50%;height:50px;border:2px solid blue;margin-top: 500px;}
ul, li { list-style:none;}/*去掉点*/
a { text-decoration:none;}/*去掉下划线*/
.nav { border:2px solid red; border-right:none; overflow:hidden; float:left; }
.nav ul li { float:right;}/*一级菜单的排布一排还是一竖*/
.nav ul li a { float:right;width:120px; height:40px;/*一级标签的款高 */ text-align:center; /*字居中*/line-height:40px;/*字体离上边的距离*/ display:block;/*使该元素成为一个块状元素，并自动换行*/ border-right:2px solid blue;/*右边竖起的框架线*/ background:#eee; color:#666;}
.nav ul li a:hover{ color:yellow; }/*当鼠标移动到一和2 级菜单时，字体的颜色*/
.nav ul li ul li a:hover{ color:red; }/*当鼠标移动到2级菜单时，字体的颜色*/
.nav ul li ul { position:absolute; /*不影响一级菜单*/display:none;}/*设置隐藏二级菜单*/
.nav ul li ul li { float:none;}
.nav ul li ul li a { border-right:none;border-top:1px dotted #ccc; background:#f5f5f5;}
.nav ul li:hover ul{ display:block;}
</style>		
	</head>
	<body>
	 <div class="nav">     
        <ul>         
            <li><a href="#">栏目一</a>
        <ul>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
        </ul>
            </li> 

            <li><a href="#">栏目二</a>
             <ul>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
             </ul>
             </li>

            <li><a href="#">栏目三</a> <ul>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
            <li><a href="#">二级栏目</a></li>
        </ul></li>
            <li><a href="#">栏目四</a></li>
            <li><a href="#">栏目五</a></li>
        </ul>
    </div>
	<div class="i1">12345646</div>
	</body>
	</html>	