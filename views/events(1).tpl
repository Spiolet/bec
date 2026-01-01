<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">

    <style>
      html, body {
        height: 100%;
        margin: 0;
        }
        body {
        display: flex;
        flex-direction: column;
        min-height: 100vh;
        }
        main {
            flex: 1; /* 主体区域自动撑开 */
            }
        /* 保留原来的 tab 结构，只改颜色 */
        .nav-tabs .nav-link {
            background-color: white; /* 保持白色背景 */
            color: #198754;           /* 绿色字体 */
            border: 1px solid #198754;
            border-radius: 0.25rem;
            margin-right: 0.25rem;
        }

        .nav-tabs .nav-link.active {
            background-color: #198754; /* active 为绿色背景 */
            color: white;
        }

        .nav-tabs .nav-link:hover {
            background-color: #e6f4ea; /* hover 淡绿色 */
            color: #145c32;
        }

        /* 事件列表卡片化，保持绿色边框 */
        .list-group-item {
            border-radius: 0.25rem;
            border: 1px solid #198754;
            margin-bottom: 0.5rem;
        }

        .list-group-item h5 {
            color: #145c32;
        }
        .list-group-item h5 a{
            all:unset;
            color:inheit;
            text-decoration:underline;
        }
                .list-group-item h5 a:hover{
            cursor:pointer;
        }

        .list-group-item small {
            color: #6c757d;
        }

        /* Carousel 控制按钮绿色圆形 */
        .carousel-control-prev-icon,
        .carousel-control-next-icon {
            background-color: rgba(25, 135, 84, 0);
            border-radius: 50%;
            padding: 18px;
        }

        .carousel-inner img {
            border-radius: 0.25rem;
        }

        .carousel-control-prev-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%2366ccff'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e");
        }
        .carousel-control-next-icon {
            background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%2366ccff'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
        }
    </style>
    
</head>
<body>
    % include('NAVBAR.tpl')
<main>
    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item white-bg" role="presentation">
                        <button class="nav-link active" id="future-tab" data-bs-toggle="tab" data-bs-target="#future-tab-pane" type="button" role="tab" aria-controls="future-tab-pane" aria-selected="false">Future</button>
                    </li>
                    <li class="nav-item white-bg" role="presentation">
                        <button class="nav-link" id="past-tab" data-bs-toggle="tab" data-bs-target="#past-tab-pane" type="button" role="tab" aria-controls="past-tab-pane" aria-selected="true">Past</button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="future-tab-pane" role="tabpanel" aria-labelledby="future-tab" tabindex="0">
                        <div class="list-group" id="fgroup"></div>
                    </div>
                    <div class="tab-pane fade" id="past-tab-pane" role="tabpanel" aria-labelledby="past-tab" tabindex="0">
                        <div class="list-group" id="pastgroup"></div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-7 col-lg-8">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="/static/event_pics/4.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/event_pics/5.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/event_pics/6.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/event_pics/7.png" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
</main>
    <script src="/static/js/bootstrap.bundle.js"></script>
    <script>
        const pastmoreset = new Set();
        const pastmore = (i)=>{ pastmoreset.add(i); loadpast(); }
        const pastless = (i)=>{ pastmoreset.delete(i); loadpast(); }

        const loadpast = ()=>{
            fetch("/api/events_past")
            .then(resp=>resp.json())
            .then(data=>{
                pastgroup.innerHTML='';
                data.forEach((item,i)=>{
                    pastgroup.innerHTML+=
                    `<div class="list-group-item list-group-item-action">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">${item.link?`<a href="${item.link}">${item.title}</a>`:`${item.title}`}</h5>
                            <small class="w-auto text-nowrap">${item.time}</small>
                        </div>
                        ${pastmoreset.has(i) ? 
                            `<p class="mb-1">${item.detail} <a href="#" onclick="pastless(${i})">show less</a></p>` :
                            `<p class="mb-1">${item.short} <a href="#" onclick="pastmore(${i})">show more</a></p>`}
                    </div>`;
                });
            }).catch(err=>console.error(err));
        };
        loadpast();

        const fmoreset = new Set();
        const fmore = (i)=>{ fmoreset.add(i); loadf(); }
        const fless = (i)=>{ fmoreset.delete(i); loadf(); }

        const loadf = ()=>{
            fetch("/api/events_future")
            .then(resp=>resp.json())
            .then(data=>{
                fgroup.innerHTML='';
                data.forEach((item,i)=>{
                    fgroup.innerHTML+=
                    `<div class="list-group-item list-group-item-action">
                        <div class="d-flex w-100 justify-content-between">
                            <h5 class="mb-1">${item.link?`<a href="${item.link}">${item.title}</a>`:`${item.title}`}</h5>
                            <small class="w-auto text-nowrap">${item.time}</small>
                        </div>
                        <p class="mb-1">${item.detail}</p> 
                    </div>`;
                });
            }).catch(err=>console.error(err));
        };
        loadf();
    </script>

    % include('FOOTER.tpl')
</body>
</html>
