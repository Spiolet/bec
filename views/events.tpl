<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">

    <style>
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
    </style>
</head>
<body>
    % include('NAVBAR.tpl')

    <div class="container">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                <ul class="nav nav-tabs" id="myTab" role="tablist">
                    <li class="nav-item white-bg" role="presentation">
                        <button class="nav-link active" id="past-tab" data-bs-toggle="tab" data-bs-target="#past-tab-pane" type="button" role="tab" aria-controls="past-tab-pane" aria-selected="true">Past</button>
                    </li>
                    <li class="nav-item white-bg" role="presentation">
                        <button class="nav-link" id="future-tab" data-bs-toggle="tab" data-bs-target="#future-tab-pane" type="button" role="tab" aria-controls="future-tab-pane" aria-selected="false">Future</button>
                    </li>
                </ul>
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="past-tab-pane" role="tabpanel" aria-labelledby="past-tab" tabindex="0">
                        <div class="list-group" id="pastgroup"></div>
                    </div>
                    <div class="tab-pane fade" id="future-tab-pane" role="tabpanel" aria-labelledby="future-tab" tabindex="0">
                        <div class="list-group" id="fgroup"></div>
                    </div>
                </div>
            </div>

            <div class="col-xs-12 col-sm-6 col-md-7 col-lg-8">
                <div id="carouselExample" class="carousel slide">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="/static/event_pics/1.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/event_pics/2.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/event_pics/3.jpg" class="d-block w-100" alt="...">
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
                            <h5 class="mb-1">${item.title}</h5>
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
                            <h5 class="mb-1">${item.title}</h5>
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
