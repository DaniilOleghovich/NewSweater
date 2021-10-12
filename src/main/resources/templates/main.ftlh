<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>
<div>
    <@l.logout/>
</div>
<div>
    <form method="post" action="/main">
        <input type="text" name="text" placeholder="Enter message text">
        <input type="text" name="tag" placeholder="Enter message tag">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Add new message</button>
    </form>
</div>
<div>
    <form method="post" action="filter">
        <input type="text" name="filter" placeholder="Filter">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <button type="submit">Filter messages</button>
    </form>
</div>

<a href="/messages">See list of messages</a>
</@c.page>
