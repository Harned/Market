<!DOCTYPE html>
<html>
<head>
    <title>M-Market</title>
</head>
<body>
<h1>M-Market</h1>
<hr>
<#if user.email??>
    <h3>Имя пользователя: <i>${user.name}</i></h3>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Выйти"/>
    </form>
    <#if user.isAdmin()>
        <a href="/admin">Панель администрирования</a>
    </#if>
<#else>
    <a href="/login">Войти</a></h1>
</#if>
<hr>
<h4>Товары по всей стране</h4>
<form action="/" method="get">
    Поиск по названию объявления: <input type="text" name="title">
    <input type="submit" value="Поиск"/>
</form>
<#list products as product>
    <div>
        <p><b>${product.title}</b> ${product.price} руб. | <a href="/product/${product.id}">Подробнее...</a></p>
    </div>
<#else>
    <h3>Товары отсутствуют</h3>
</#list>
<#if user.email??>
    <hr>
    <h3>Добавить новый товар</h3>
    <form action="/product/create" method="post" enctype="multipart/form-data">
        Название товара: <input type="text" name="title"/><br><br>
        Описание товара: <input type="text" name="description"/><br><br>
        Цена: <input type="number" name="price"/><br><br>
        Город: <input type="text" name="city"/><br><br>
        1-ая фотография: <input type="file" name="file1"/><br><br>
        2-ая фотография: <input type="file" name="file2"/><br><br>
        3-ая фотография: <input type="file" name="file3"/><br><br>
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Добавить товар"/>
    </form>
</#if>
</body>
</html>