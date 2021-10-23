<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>

<@c.page>

    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="post" action="filter" class="form-inline">
                <input type="text" class="form-control" name="filter" id="filter" placeholder="Search by tag">
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <button type="submit" class="btn btn-primary ml-3">Search</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" data-toggle="collapse" href="#collapseForm" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new message
    </a>

    <div id="collapseForm" class="collapse mt-3 <#if message??> show </#if>">
        <div class="form-group">
            <form method="post" action="/main" enctype="multipart/form-data" >
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??> ${message.text} </#if>" name="text" placeholder="Enter message text">
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}" name="tag"
                           value="<#if message??> ${message.tag} </#if>" placeholder="Enter message tag">
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" id="customFile" class="custom-file-input" name="file" placeholder="Add your file">
                        <label class="custom-file-label" for="validatedCustomFile">Choose file...</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}">
                <div class="form-group d-flex justify-content-end">
                    <button type="submit" class="btn btn-primary">Create</button>
                </div>
            </form>
        </div>
    </div>


<a href="/messages">See list of messages</a>
</@c.page>
