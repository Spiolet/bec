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
            /* -------- Article list beautify -------- */
            .list-group {
            border: none;
            margin-top: 10px;
            }

            .list-group-item {
            border: none;
            border-bottom: 1px solid #eaeaea;
            padding: 14px 18px;
            background-color: #fff;
            transition: all 0.2s ease;
            font-size: 1rem;
            }

            .list-group-item:last-child {
            border-bottom: none;
            }

            .list-group-item a {
            text-decoration: none;
            color: #212529;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: space-between;
            }

            .list-group-item a::after {
            content: "›";  /* 箭头符号 */
            font-size: 1.2rem;
            color: #aaa;
            transition: transform 0.2s ease, color 0.2s ease;
            }

            .list-group-item:hover {
            background-color: #f8f9fa;
            }

            .list-group-item:hover a {
            color: #198754;
            }

            .list-group-item:hover a::after {
            transform: translateX(4px);
            color: #198754;
            }

        </style>
    </head>
    <body>
        </style>
        % include('NAVBAR.tpl')
        <main>
            <div class="container white-bg">
                <div class="row p-3">
                    <h1> Articles </h1>
                    <ul class="list-group">
                        % for item in recaps:
                            <li class="list-group-item">
                                <a href="/crc/{{item[0]}}">
                                {{item[0]}} </a>
                            </li>
                            %end
                    </ul>
                </div>
            </div>
        </main>
        % include('FOOTER.tpl')
    <script src="/static/js/bootstrap.bundle.js"></script>
    </body>
</html>