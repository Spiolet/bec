<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/static/css/bootstrap.css" rel="stylesheet">
        <link href="/static/css/bgi.css" rel="stylesheet">


    </head>
        <body>
        % include('NAVBAR.tpl')
        
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item white-bg" role="presentation">
                            <button class="nav-link active" id="past-tab" data-bs-toggle="tab" data-bs-target="#past-tab-pane" type="button" role="tab" aria-controls="home-tab-pane" aria-selected="true">Past</button>
                        </li>
                        <li class="nav-item white-bg" role="presentation">
                            <button class="nav-link" id="future-tab" data-bs-toggle="tab" data-bs-target="#future-tab-pane" type="button" role="tab" aria-controls="profile-tab-pane" aria-selected="false">Future</button>
                        </li>
                    </ul>
                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane fade show active" id="past-tab-pane" role="tabpanel" aria-labelledby="past-tab" tabindex="0">
                            <div class="list-group" id="pastgroup">
                            </div>
                        </div>
                        <div class="tab-pane fade" id="future-tab-pane" role="tabpanel" aria-labelledby="future-tab" tabindex="0">
                            <div class="list-group" id="fgroup">

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-7 col-lg-8">
                    <div id="carouselExample" class="carousel slide">
                        <div class="carousel-inner">
                            <div class="carousel-item active">
                            <img src="/static/album/1.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                            <img src="/static/album/2.jpg" class="d-block w-100" alt="...">
                            </div>
                            <div class="carousel-item">
                            <img src="/static/album/3.jpg" class="d-block w-100" alt="...">
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
            const pastmoreset=new Set();
            const pastmore=(i)=>{
                pastmoreset.add(i);
                loadpast();
            }
            const pastless=(i)=>{
                pastmoreset.delete(i);
                loadpast();
            }
            const loadpast=()=>{
                const requestOptions = {
                method: "GET",
                redirect: "follow"
                };

                fetch("/api/events_past", requestOptions)
                .then((response) => response.text())
                .then((result) => {
                    let data = JSON.parse(result)
                    console.log(data)
                    pastgroup.innerHTML='';
                    for (let i=0;i<data.length;i++){
                        pastgroup.innerHTML+="<div href=\"#\" class=\"list-group-item list-group-item-action\">"
                                                +"<div class=\"d-flex w-100 justify-content-between\">"
                                                    +"<h5 class=\"mb-1\">"+ data[i]['title']+"</h5>"
                                                    +"<small class=\"w-auto text-nowrap\">"+ data[i]['time']+"</small>"
                                                +"</div>"
                                                +(pastmoreset.has(i)? ("<p class=\"mb-1\">"+ data[i]['detail']+"<a href=\"#\" onclick=\"pastless("+i+")\">show less</a></p>"): ("<p class=\"mb-1\">"+ data[i]['short']+"<a href=\"#\" onclick=\"pastmore("+i+")\">show more</a></p>"))
                                            +"</div>"
                    }
                })
                .catch((error) => console.error(error));
            }
            loadpast();

            const fmoreset=new Set();
            const fmore=(i)=>{
                fmoreset.add(i);
                loadf();
            }
            const fless=(i)=>{
                fmoreset.delete(i);
                loadf();
            }
            const loadf=()=>{
                const requestOptions = {
                method: "GET",
                redirect: "follow"
                };

                fetch("/api/events_future", requestOptions)
                .then((response) => response.text())
                .then((result) => {
                    let data = JSON.parse(result)
                    console.log(data)
                    fgroup.innerHTML='';
                    for (let i=0;i<data.length;i++){
                        fgroup.innerHTML+="<div href=\"#\" class=\"list-group-item list-group-item-action\">"
                                                +"<div class=\"d-flex w-100 justify-content-between\">"
                                                    +"<h5 class=\"mb-1\">"+ data[i]['title']+"</h5>"
                                                    +"<small class=\"w-auto text-nowrap\">"+ data[i]['time']+"</small>"
                                                +"</div>"
                                                +(fmoreset.has(i)? ("<p class=\"mb-1\">"+ data[i]['detail']+"<a href=\"#\" onclick=\"fless("+i+")\">show less</a></p>"): ("<p class=\"mb-1\">"+ data[i]['short']+"<a href=\"#\" onclick=\"fmore("+i+")\">show more</a></p>"))
                                            +"</div>"
                    }
                })
                .catch((error) => console.error(error));
            }
            loadf();
    </script>
        % include('FOOTER.tpl')
    </body>
</html>