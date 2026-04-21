<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">
    <link href="/static/css/listgroup.css" rel="stylesheet">
    <link href="https://unpkg.com/video.js@8.23.7/dist/video-js.min.css" rel="stylesheet">
    <script src="https://unpkg.com/video.js@8.23.7/dist/video.min.js"></script>

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
        border-left: 5px solid #198754;
        padding-left: 0.75rem;
        color: #145c32;
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
        background-color: #e8f5e9;
        border-radius: 0.75rem;
        box-shadow: inset 0 0 6px rgba(0,0,0,0.05);
      }

      .scroll-content {
        display: flex;
        width: max-content;
        animation: scroll-left 120s linear infinite;
      }

      .scroll-content img {
        height: 250px;
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
        border-left: 4px solid #19875420;
      }

      .list-group-item:hover {
        background-color: #e8f5e9;
      }

      .carousel-control-prev-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23198754'%3e%3cpath d='M11.354 1.646a.5.5 0 0 1 0 .708L5.707 8l5.647 5.646a.5.5 0 0 1-.708.708l-6-6a.5.5 0 0 1 0-.708l6-6a.5.5 0 0 1 .708 0z'/%3e%3c/svg%3e");
        background-color: rgba(201,201,201,0.3);
      }

      .carousel-control-next-icon {
        background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16' fill='%23198754'%3e%3cpath d='M4.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L10.293 8 4.646 2.354a.5.5 0 0 1 0-.708z'/%3e%3c/svg%3e");
        background-color: rgba(201,201,201,0.3);
      }

      .about-list {
        padding-left: 1.5rem;
        margin-bottom: 1.5rem;
      }

      .about-list li {
        margin-bottom: 0.75rem;
        font-size: 1.25rem;
        font-weight: 300;
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
        <div class="col-md-6 mb-4 mb-md-0" style="padding-right: 25px">
          <div id="carouselExampleIndicators" class="carousel slide shadow rounded overflow-hidden" data-bs-ride="carousel">
            <div class="carousel-indicators">
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></button>
              <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></button>
            </div>

            <div class="carousel-inner">
              <div class="carousel-item">
                <img src="/static/pics/ncp.jpg" class="d-block w-100" alt="pic1">
              </div>
              <div class="carousel-item active">
                <img src="/static/pics/jkg.png" class="d-block w-100" alt="pic2">
              </div>
              <div class="carousel-item">
                <img src="/static/pics/gg.png" class="d-block w-100" alt="pic3">
              </div>
            </div>

            <button class="carousel-control-prev" type="button" style="width:5%" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
              <span class="carousel-control-prev-icon"></span>
            </button>
            <button class="carousel-control-next" type="button" style="width:5%" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
              <span class="carousel-control-next-icon"></span>
            </button>
          </div>
        </div>

        <div class="col-md-6" style="padding-left: 25px">
          <h1 class="section-title">About the Boston Eaglets Club</h1>

          <p class="lead" style="font-weight:normal">
            Founded in 2023, the Boston Eaglets Club is a welcoming community for junior golfers across the Greater Boston area, open to players of all skill levels. Our goal is to create a supportive environment where young golfers can play, learn, and grow together both on and off the course.
          </p>

          <p class="lead" style="font-weight:normal">
            Our club focuses on four main areas:
          </p>

          <ul class="about-list">
            <li>
              <a href="/gallery/bge" class="link">Organizing social golf events for junior golfers</a>
            </li>
            <a href="/gallery/bge" class="btn btn-sm btn-outline-success" style="font-size:15px" target="_blank">
            More ==>
            </a>
            <li>
              <a href="/gallery/vlc" class="link">Volunteering within the local communities</a>
            </li>
            <a href="/gallery/vlc" class="btn btn-sm btn-outline-success" style="font-size:15px" target="_blank">
            More ==>
            </a>
            <li>
              <a href="/gallery/as" class="link">Running an Adaptive Golf coaching program for children with special needs</a>
            </li>
            <a href="/gallery/as" class="btn btn-sm btn-outline-success" style="font-size:15px" target="_blank">
            More ==>
            </a>
            <li>
              <a href="/gallery/fe" class="link">Fundraising for charitable causes</a>
            </li>
            <a href="/gallery/fe" class="btn btn-sm btn-outline-success" style="font-size:15px" target="_blank">
            More ==>
            </a>
          </ul>

          <a href="https://forms.gle/5e8Y8yTgawhZ4iGE8" class="btn btn-sm btn-outline-success" style="font-size:30px" target="_blank">
            Join us! <i class="bi bi-send-plus"></i>
          </a>

          <hr>

          <h1 class="section-title mt-6">Impact at a Glance</h1>
          <div class="row" style="font-size:15px;text-align:center">
            <div class="col-6 col-md-3 p-0">
              <h2 style="font-size:30px; font-weight:bold;">40+</h2>
              <p>Members</p>
            </div>
            <div class="col-6 col-md-3 p-0">
              <h2 style="font-size:30px; font-weight:bold;">$6000+</h2>
              <p>Raised for Charity</p>
            </div>
            <div class="col-6 col-md-3 p-0">
              <h2 style="font-size:30px; font-weight:bold;">10+</h2>
              <p>Events Organized</p>
            </div>
            <div class="col-6 col-md-3 p-0">
              <h2 style="font-size:30px; font-weight:bold;">300+</h2>
              <p>Volunteer Hours</p>
            </div>
          </div>
        </div>
      </div>

      <!-- Founders & Events -->
      <div class="row g-4 mb-5">
        <div class="col-md-6" style="padding-right:25px">
          <h1 class="section-title">Meet The Team</h1>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/BWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Brian Li</h2>
                <h3>Class of 2027</h3>
                <h4 class="mb-0">President, Founder</h4>
              </div>
            </div>
          </div>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/SWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Spencer Haohang Wu</h2>
                <h3>Class of 2030</h3>
                <h4 class="mb-0">Website Administrator, Co-Founder</h4>
              </div>
            </div>
          </div>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/twbh.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Taylor Pan</h2>
                <h3>Class of 2027</h3>
                <h4 class="mb-0">High School Ambassador</h4>
              </div>
            </div>
          </div>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/vwbh.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Valerie Luxieo</h2>
                <h3>Class of 2028</h3>
                <h4 class="mb-0">High School Ambassador</h4>
              </div>
            </div>
          </div>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/JWBH.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Jayden Junhang Wu</h2>
                <h3>Class of 2032</h3>
                <h4 class="mb-0">Middle School Ambassador</h4>
              </div>
            </div>
          </div>

          <div class="card p-3 mb-3">
            <div class="row g-3 align-items-center">
              <div class="col-3"><img src="/static/pics/bcwbh.png" class="founder-img"></div>
              <div class="col-8 text-center">
                <h2>Bryant Cai</h2>
                <h3>Class of 2028</h3>
                <h4 class="mb-0">High School Ambassador</h4>
              </div>
            </div>
          </div>

          <a href="/about" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>

        <div class="col-md-6" style="padding-left:25px">
          <h1 class="section-title">Events</h1>
          <div class="card p-3 mb-3">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
              <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#past-tab-pane">Past</button></li>
              <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#future-tab-pane">Future</button></li>
            </ul>

            <div class="tab-content mt-3">
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
            </div>
          </div>

          <a href="/events" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
          <!put the video stuff here>
        </div>
      </div>

      <!-- Recaps & Gallery -->
      <div class="row mb-5 g-4">
        <div class="col-md-12">
          <h1 class="section-title">Articles</h1>
          <div class="card p-3 mb-3">
            <ul class="list-group-recaps" style="margin-top:0px; margin-bottom:0px">
              % for item in recaps:
              <li class="list-group-item-recaps" style="padding:7px">
                <a href="/crc/{{item[0]}}">
                  <span style="flex: 1 1 auto">{{item[0].split('+')[1]}}</span>
                  <span style="flex: 0 0 auto; margin-right: 10px; font-size: smaller; font-weight: lighter;">
                    <i class="bi bi-person-fill"></i> {{item[0].split('+')[3]}}
                    <i class="bi bi-calendar-plus"></i> {{item[0].split('+')[2]}}
                  </span>
                </a>
              </li>
              % end
            </ul>
          </div>

          <a href="/cr" class="btn btn-sm btn-outline-success float-end">
            More <i class="bi bi-arrow-right"></i>
          </a>
        </div>
      </div>

      <div class="row g-4">
        <div class="col-md-12">
          <h1 class="section-title">Gallery</h1>
          <div class="scroll-wrapper mb-3">
            <div class="scroll-content">
              % for event, pics in album:
                % for item in pics:
                  <img src="/static/thumb/{{event}}/{{item}}">
                % end
              % end

              % for event, pics in album:
                % for item in pics:
                  <img src="/static/thumb/{{event}}/{{item}}">
                % end
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