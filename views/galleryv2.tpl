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
            position: relative; /* needed for stretched link */
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 18px rgba(0,0,0,0.08);
        }

        /* 👇 stacked header */
        .card-header-custom {
            display: block;
        }

        /* 👇 bigger title */
        .section-title {
            margin-bottom: 0.5rem;
            border-left: 5px solid #198754;
            padding-left: 0.75rem;
            color: #198754;
            text-decoration: underline;
            display: inline-block;
            font-size: 2.2rem;
            font-weight: 700;
        }

        .section-title:hover {
            color: #145c32;
        }

        /* 👇 keeps heights aligned */
        .card h1 {
            min-height: 100px;
        }

        /* 👇 button under title */
        .more-btn {
            display: inline-block;
            margin-top: 6px;
            font-size: 0.9rem;
            color: #198754;
            text-decoration: none;
            border: 1.5px solid #198754;
            padding: 5px 12px;
            border-radius: 999px;
            background: transparent;
            transition: all 0.25s ease;
            position: relative;
            z-index: 2; /* keep button clickable above stretched link */
        }

        .more-btn:hover {
            background: #198754;
            color: white;
        }

        /* 👇 image */
        .image-box {
            width: 100%;
            aspect-ratio: 4 / 3;
            overflow: hidden;
            border-radius: 0.75rem;
        }

        .image-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: block;
        }

        /* 👇 stretched link */
        .stretched-link {
            position: absolute;
            inset: 0;
            z-index: 1;
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
                <a href="/gallery/bge" class="stretched-link"></a>

                <div class="mt-3 px-3 card-header-custom pt-5">
                    <h1 class="mb-0">
                        <span class="section-title">BEC Golf Events</span>
                    </h1>
                    <a href="/gallery/bge" class="more-btn">More →</a>
                </div>

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
                <a href="/gallery/as" class="stretched-link"></a>

                <div class="mt-3 px-3 card-header-custom pt-5">
                    <h1 class="mb-0">
                        <span class="section-title">Adaptive Golf for Special Needs</span>
                    </h1>
                    <a href="/gallery/as" class="more-btn">More →</a>
                </div>

                <div class="px-3 pb-3">
                    <div class="image-box">
                        <img src="/static/thumb/Apr 5 2026 Spring Adaptive Golf Kickoff+11/1.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="mt-2 col-md-6 col-xs-12 gx-2">
            <div class="card">
                <a href="/gallery/fe" class="stretched-link"></a>

                <div class="mt-3 px-3 card-header-custom pt-5">
                    <h1 class="mb-0">
                        <span class="section-title">Fundraising Events</span>
                    </h1>
                    <a href="/gallery/fe" class="more-btn">More →</a>
                </div>

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
                <a href="/gallery/vlc" class="stretched-link"></a>

                <div class="mt-3 px-3 card-header-custom pt-5">
                    <h1 class="mb-0">
                        <span class="section-title">Volunteering at Local Communities</span>
                    </h1>
                    <a href="/gallery/vlc" class="more-btn">More →</a>
                </div>

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