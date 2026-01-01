<html>
    <head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/static/css/bootstrap.css" rel="stylesheet">
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
            /* -------- Article list beautify -------- */


        </style>
    </head>
    <body>
        </style>
        % include('NAVBAR.tpl')
        <main>
            <div class="container white-bg">
                <div class="row p-3">
                    <h1> Articles </h1>
                    <ul class="list-group-recaps">
                        % for item in recaps:
                            <li class="list-group-item-recaps">
                                <a href="/crc/{{item[0]}}">
                                    <span style="flex: 1 1 auto">{{item[0].split('+')[1]}}</span>
                                    <span style="flex: 0 0 auto; margin-right: 10px; font-size: smaller; font-weight: lighter;"><i class="bi bi-calendar-plus"></i> {{item[0].split('+')[2]}}</span>
                                </a>
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