<html>
  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.min.css" rel="stylesheet">
    <link href="/static/css/bootstrap-icons.min.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">
    <link href="/static/css/listgroup.css" rel="stylesheet">
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
    </style>
  </head>
  <body>
    % include('NAVBAR.tpl')
    <main>
      <div class="container">
        <div class="row">
          <div class="col-lg-4 offset-lg-2 col-md-6 col-sm-12 col-xs-12">
            <div class="card p-3 mb-3">
              <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item"><button class="nav-link active" data-bs-toggle="tab" data-bs-target="#zelle-tab-pane">Zelle</button></li>
                <li class="nav-item"><button class="nav-link" data-bs-toggle="tab" data-bs-target="#venmo-tab-pane">Venmo</button></li>
              </ul>
              <div class="tab-content mt-3">
                <div class="tab-pane fade d-flex justify-content-center show active" id="zelle-tab-pane">
                  <img id="zelleImg" src="/static/pics/donate-zelle.png" alt="Original Image" class="img-fluid mx-auto d-block">
                </div>
                <div class="tab-pane d-flex justify-content-center fade" id="venmo-tab-pane">
                  <img id="venmoImg" src="/static/pics/donate-venmo.png" alt="Original Image" class="img-fluid mx-auto d-block">
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-4 col-md-6 col-sm-12 col-xs-12">
            <div class="card p-3 mb-3">
              <h1>How can you help us?</h1>
              <p>Thank you for all the support, introducing the wonderful game of golf to more kids and families!</p>
              <p>Contract: Wendyhu2511@gmail.com</p>
            </div>
          </div>
        </div>
      </div>
    </main>
    % include('FOOTER.tpl')
    <script src="/static/js/bootstrap.bundle.js"></script>
  </body>
</html>