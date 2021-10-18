<#import "parts/common.ftlh" as c>

<@c.page>
<h1>
        List of messages
</h1>
    <div class="row">
        <#list messages as message>
            <div class="col-6">
            <div class="card my-3 align-self-stretch">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="card-body m-2">
                    <span class="card-text">${message.text!""}</span>
                    <i class="card-text">${message.tag!""}</i>

                </div>
                <div class="card-footer text-muted">
                    ${message.authorName}
                </div>
            </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>