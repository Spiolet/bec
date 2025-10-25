<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">
    <style>
      .container {
        background-color: #f8f9fa;
        color: #212529;
      }
      h1, h3 {
        font-weight: 700;
      }
      .section-title {
        margin-bottom: 1rem;
        border-left: 5px solid #198754; /* 主绿色 */
        padding-left: 0.75rem;
        color: #145c32; /* 深绿色标题 */
      }
      .card {
        border: none;
        border-radius: 1rem;
        box-shadow: 0 4px 12px rgba(0,0,0,0.05);
        transition: transform 0.2s, box-shadow 0.2s;
        background: #ffffff;
      }
      .card:hover {
        transform: translateY(-4px);
        box-shadow: 0 6px 16px rgba(0,0,0,0.1);
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
        background-color: #e8f5e9; /* 浅绿色背景 */
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
        color: #198754;
        font-weight: 500;
        text-decoration: none;
      }
      .link:hover {
        color: #145c32;
        text-decoration: underline;
      }
      .nav-tabs .nav-link.active {
        background-color: #198754;
        color: #fff !important;
        border: none;
        border-radius: 0.5rem 0.5rem 0 0;
      }
      .nav-tabs .nav-link {
        color: #198754;
      }
      .list-group-item {
        border-left: 4px solid #19875420; /* 绿色淡边 */
      }
      .list-group-item:hover {
        background-color: #e8f5e9;
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
                <img src="/static/pics/FGM.png" class="d-block w-100" alt="pic1">
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
            In golf, an "eagle" represents excellence, ambition, and skill. The Boston Eaglets Club takes inspiration from this, creating a space for local young golfers to spread their wings and soar. Our club consists of young players from the Boston area to play, compete, and support each other in golf and beyond.The Boston Eaglets Club is all about fostering a love for golf by building a fun, supportive community. We welcome young golfers of all skill levels, encouraging everyone to grow, make friends, and enjoy the game. Beyond golf, we believe in giving back to our community through volunteer work and fundraising, helping make a positive impact on and off the course.
          </p>
          <a href="https://forms.gle/5e8Y8yTgawhZ4iGE8" class="btn btn-sm btn-outline-success" style="font-size:30px" target="_blank">
            Join us! <i class="bi bi-send-plus"></i>
          </a>
        </div>
      </div>

      <!-- Founders & Events -->
      <div class="row g-4 mb-5">
        <div class="col-md-6">
          <h1 class="section-title">Meet The Team</h1>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/BWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Brian Li, Class of 2027</h2>
                <h4 class="mb-0">President, Founder</h4>
              </div>
            </div>
          </div>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/SWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Spencer Wu, Class of 2030</h2>
                <h4 class="mb-0">Website Administrator, Co-Founder</h4>
              </div>
            </div>
          </div>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/twbh.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Taylor Pan, Class of 2027</h2>
                <h4 class="mb-0">High School Ambassador</h4>
              </div>
            </div>
          </div>
          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/JWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Jayden Wu, Class of 2032</h2>
                <h4 class="mb-0">Middle School Ambassador</h4>
              </div>
            </div>
          </div>
          <a href="/about" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>
        <div class="col-md-6">
          <h1 class="section-title">Events</h1>
          <div class="card p-3 mb-3">
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
          <a href="/events" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>
      </div>

      <!-- Recaps & Gallery -->
      <div class="row g-4">
        <div class="col-md-6">
          <h1 class="section-title">Recaps</h1>
          <div class="card p-3 mb-3">
            <ul class="list-group list-group-flush">
              % for item in recaps:
              <li class="list-group-item"><a href="/crc/{{item[0]}}">{{item[0]}}</a></li>
              %end
            </ul>
          </div>
          <a href="/cr" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>
        <div class="col-md-6">
          <h1 class="section-title">Gallery</h1>
          <div class="scroll-wrapper mb-3">
            <div class="scroll-content">
              % for index, item in enumerate(album):
              <img src="/static/thumb/{{item}}" alt="{{index}}">
              % end
              % for index, item in enumerate(album):
              <img src="/static/thumb/{{item}}" alt="{{index}}">
              % end
            </div>
          </div>
          <a href="/gallery" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>
      </div>
    </div>


    % include('FOOTER.tpl')

    <script src="/static/js/bootstrap.bundle.js"></script>
  </body>
</html>
