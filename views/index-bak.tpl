<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <style>
      body {
        background-color: #f8f9fa;
        font-family: "Inter", "Helvetica Neue", Arial, sans-serif;
        color: #212529;
      }
      h1, h3 {
        font-weight: 700;
      }
      .section-title {
        margin-bottom: 1rem;
        border-left: 5px solid #0d6efd;
        padding-left: 0.75rem;
      }
      .card {
        border: none;
        border-radius: 1rem;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        transition: transform 0.2s;
      }
      .card:hover {
        transform: translateY(-4px);
      }
      .carousel img {
        border-radius: 0.75rem;
      }
      .founder-img {
        width: 100%;
        border-radius: 50%;
        border: 3px solid #e9ecef;
        box-shadow: 0 4px 12px rgba(0,0,0,0.1);
      }
      .scroll-wrapper {
        overflow: hidden;
        position: relative;
        background-color: #fff;
        border-radius: 0.75rem;
        box-shadow: inset 0 0 6px rgba(0,0,0,0.05);
      }
      .scroll-content {
        display: flex;
        width: max-content;
        animation: scroll-left 40s linear infinite;
      }
      .scroll-content img {
        height: 180px;
        margin-right: 12px;
        border-radius: 0.5rem;
        transition: transform 0.3s;
      }
      .scroll-content img:hover {
        transform: scale(1.05);
      }
      @keyframes scroll-left {
        from { transform: translateX(0); }
        to { transform: translateX(-50%); }
      }
      .link {
        color: #0d6efd;
        font-weight: 500;
        text-decoration: none;
      }
      .link:hover {
        text-decoration: underline;
      }
    </style>
  </head>
  <body>
    % include('NAVBAR.tpl')

    <!-- Hero -->
    <div class="container-fluid px-0">
      <img src="/static/pics/group_pic.png" alt="a cool photo" class="img-fluid w-100" style="max-height:480px; object-fit:cover;">
    </div>

    <div class="container py-5">

      <!-- Intro -->
      <div class="row align-items-center mb-5">
        <div class="col-md-6 mb-4 mb-md-0">
          <div id="carouselExampleIndicators" class="carousel slide shadow rounded overflow-hidden">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
            </div>
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="/static/pics/group_pic.png" class="d-block w-100" alt="pic1">
              </div>
              <div class="carousel-item">
                <img src="/static/pics/group_pic.png" class="d-block w-100" alt="pic2">
              </div>
              <div class="carousel-item">
                <img src="/static/pics/group_pic.png" class="d-block w-100" alt="pic3">
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
        </div>
        <div class="col-md-6">
          <h1 class="section-title">Introduction</h1>
          <p class="lead">
            In golf, an "eagle" represents excellence, ambition, and skill. The Boston Eaglets Club takes inspiration from this, creating a space for local young golfers to spread their wings and soar. Our club consists of young players from the Boston area to play, compete, and support each other in golf and beyond.
          </p>
        </div>
      </div>

      <!-- Founders & Events -->
      <div class="row g-4 mb-5">
        <div class="col-md-6">
          <h1 class="section-title">Founders</h1>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-4"><img src="/static/pics/BWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h3>Brian Li</h3>
                <p class="mb-0 small">10th grade, handicap 5 (gold tees)</p>
              </div>
            </div>
          </div>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-4"><img src="/static/pics/SWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h3>Haohang Wu</h3>
                <p class="mb-0 small">8th grade, handicap 12 (blue tees)</p>
              </div>
            </div>
          </div>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-4"><img src="/static/pics/JWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h3>Junhang Wu</h3>
                <p class="mb-0 small">5th grade, handicap 3 (red tees)</p>
              </div>
            </div>
          </div>
          <a class="link d-block text-end" href="/about">more &gt;</a>
        </div>
        <div class="col-md-6">
          <h1 class="section-title">Events</h1>
          <div class="card p-3">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#past-tab-pane">Past</button></li>
              <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#future-tab-pane">Future</button></li>
            </ul>
            <div class="tab-content mt-3">
              <div class="tab-pane fade show active" id="past-tab-pane">
                <div class="list-group">
                  % for item in EVENTS_PAST:
                  <div class="list-group-item">
                    <div class="d-flex justify-content-between">
                      <h5>{{ item['title'] }}</h5>
                      <small>{{ item['time'] }}</small>
                    </div>
                    <p class="mb-0">{{ item['short'] }}</p>
                  </div>
                  % end
                </div>
              </div>
              <div class="tab-pane fade" id="future-tab-pane">
                <div class="list-group">
                  % for item in EVENTS_FUTURE:
                  <div class="list-group-item">
                    <div class="d-flex justify-content-between">
                      <h5>{{ item['title'] }}</h5>
                      <small>{{ item['time'] }}</small>
                    </div>
                    <p class="mb-0">{{ item['short'] }}</p>
                  </div>
                  % end
                </div>
              </div>
            </div>
          </div>
          <a class="link d-block text-end mt-2" href="/events">more &gt;</a>
        </div>
      </div>

      <!-- Recaps & Gallery -->
      <div class="row g-4">
        <div class="col-md-6">
          <h1 class="section-title">Recaps</h1>
          <div class="card p-3">
            <ul class="list-group list-group-flush">
              % for item in recaps:
              <li class="list-group-item"><a href="/crc/{{item[0]}}">{{item[0]}}</a></li>
              %end
            </ul>
          </div>
          <a class="link d-block text-end mt-2" href="/cr">more &gt;</a>
        </div>
        <div class="col-md-6">
          <h1 class="section-title">Gallery</h1>
          <div class="scroll-wrapper mb-2">
            <div class="scroll-content">
              % for index, item in enumerate(album):
              <img src="/static/thumb/{{item}}" alt="{{index}}">
              % end
              % for index, item in enumerate(album):
              <img src="/static/thumb/{{item}}" alt="{{index}}">
              % end
            </div>
          </div>
          <a class="link d-block text-end" href="/gallery">more &gt;</a>
        </div>
      </div>
    </div>

    % include('FOOTER.tpl')

    <script src="/static/js/bootstrap.bundle.js"></script>
  </body>
</html>
