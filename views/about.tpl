<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
  </head>
  <body>
    % include('NAVBAR.tpl')

    <div class="container white-bg py-4">
      <!-- Banner -->
      <img src="/static/pics/group_pic.png" alt="Club group photo" class="img-fluid rounded shadow-sm mb-4">

      <!-- Club Intro -->
      <h1 class="text-center mb-4 text-success">The Boston Eaglets Club</h1>

      <div class="card shadow-sm border-success mb-4">
        <div class="card-body">
          <h3 class="text-success">Introduction</h3>
          <p>A welcoming community since 2023 for junior golfers across Greater Boston—open to all skill levels. We play, learn, and support one another on and off the course.</p>
        </div>
      </div>

      <div class="card shadow-sm border-success mb-4">
        <div class="card-body">
          <h3 class="text-success">Mission Statement</h3>
          <p>The Boston Eaglets Club is all about fostering a love for golf by building a fun, supportive community. We welcome young golfers of all skill levels, encouraging everyone to grow, make friends, and enjoy the game. Beyond golf, we believe in giving back to our community through volunteer work and fundraising, helping make a positive impact on and off the course.</p>
        </div>
      </div>

      <div class="card shadow-sm border-success mb-4">
        <div class="card-body">
          <h3 class="text-success">How to Join Us</h3>
            <div class="col-md-6">
              </p>
              <a href="https://forms.gle/5e8Y8yTgawhZ4iGE8" class="btn btn-sm btn-outline-success" style="font-size:30px" target="_blank">
                Join us! <i class="bi bi-send-plus"></i>
              </a>
            </div>
        </div>
      </div>


    % include('FOOTER.tpl')
    <script src="/static/js/bootstrap.bundle.js"></script>
  </body>
</html>
