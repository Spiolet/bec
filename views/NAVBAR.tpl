<nav class="navbar navbar-expand-lg bg-white">
    <div class="container bg-white">  
        <a class="navbar-brand" href="/">
            <img src="/static/pics/10.png"class="img-fluid" style="height:60px">
            Boston Eaglets Club
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto me-auto mb-2 mb-lg-0">
                % for item in NAVBAR:
                <li lass="nav-item">
                    <a class="nav-link" href="{{ item['url'] }}" style="height:70px;align-content:center">{{item['name'] }}</a>
                </li>
                % end
            </ul>
        </div>
    </div>
</nav>