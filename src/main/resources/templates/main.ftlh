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

    <div id="collapseForm" class="collapse mt-3">
        <div class="form-group">
            <form method="post" action="/main" enctype="multipart/form-data" >
                <div class="form-group">
                    <input type="text" class="form-control" name="text" placeholder="Enter message text">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" name="tag" placeholder="Enter message tag">
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
