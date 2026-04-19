<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/bgi.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

    <style>
        .card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            transition: transform 0.2s, box-shadow 0.2s;
            background: #ffffff;
            height: 100%;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 18px rgba(0,0,0,0.08);
        }

        .section-title {
            margin-bottom: 1rem;
            border-left: 5px solid #198754;
            padding-left: 0.75rem;
            color: #198754;
            text-decoration: underline;
            display: inline-block;
        }

        .section-title:hover {
            color: #145c32;
        }

        /* 👇 keeps titles aligned */
        .card h1 {
            min-height: 100px;
            font-size: 1.6rem;
        }

        /* 👇 responsive image container */
        .image-box {
            width: 100%;
            aspect-ratio: 4 / 3; /* change to 16/9 if you want */
            overflow: hidden;
            border-radius: 0.75rem;
        }

        .image-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }
    </style>
</head>

<body>

% include('NAVBAR.tpl')

<div class="container">
    <div class="row mb-2">

        <!-- Card 1 -->
        <div class="mt-2 col-md-6 col-xs-12 gx-2">
            <div class="card">
                <h1 class="mt-3 px-3">
                    <a class="section-title" href="/gallery/bge">BEC Golf Events</a>
                </h1>
                <div class="px-3 pb-3">
                    <div class="image-box">
                        <img src="/static/thumb/Oct 25 2025 BEC Fall Outing at Brae Burn CC+5/1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 2 -->
        <div class="mt-2 col-md-6 col-xs-12 gx-2">
            <div class="card">
                <h1 class="mt-3 px-3">
                    <a class="section-title" href="/gallery/as">Adaptive Golf for Special Needs</a>
                </h1>
                <div class="px-3 pb-3">
                    <div class="image-box">
                        <img src="/static/thumb/Apr 5 2026 Spring Adaptive Sports Kickoff+11/1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="mt-2 col-md-6 col-xs-12 gx-2">
            <div class="card">
                <h1 class="mt-3 px-3">
                    <a class="section-title" href="/gallery/fe">Fundraising Events</a>
                </h1>
                <div class="px-3 pb-3">
                    <div class="image-box">
                        <img src="/static/thumb/Oct 26 2024 Fundraising at US Kids 2024 Fall Season Championship+3/1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="mt-2 col-md-6 col-xs-12 gx-2">
            <div class="card">
                <h1 class="mt-3 px-3">
                    <a class="section-title" href="/gallery/vlc">Volunteering at Local Communities</a>
                </h1>
                <div class="px-3 pb-3">
                    <div class="image-box">
                        <img src="/static/thumb/Volunteering at Local Events+2/3.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>

% include('FOOTER.tpl')

</body>
</html>