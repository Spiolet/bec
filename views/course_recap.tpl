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
        </style>
    </head>
    <body>
        </style>
        % include('NAVBAR.tpl')
        <main>
            <div class="container white-bg">
                <div class="row p-3">
                    <h1> Articles </h1>
                    <h3> Course Recaps </h3>
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