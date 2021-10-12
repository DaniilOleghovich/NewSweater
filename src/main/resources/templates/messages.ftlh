<#import "parts/common.ftlh" as c>

<@c.page>
<h1>
        List of messages
</h1>
<#list messages as message>
<div>
        <b>${message.id}</b>
        <span>${message.text!""}</span>
        <i>${message.tag!""}</i>
        <strong>${message.authorName}</strong>
    </div>
<#else>
    No messages
</#list>
<a href="/main">Go to Main Page</a>
</@c.page>