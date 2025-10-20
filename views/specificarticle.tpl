<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/static/css/bootstrap.css" rel="stylesheet">
        <link href="/static/css/bgi.css" rel="stylesheet">
        <style>
        body {
            background-color: #f8f9fa;
        }

        .white-bg {
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
            padding: 40px 60px;
            margin-top: 40px;
            margin-bottom: 40px;
        }

        /* Markdown内容基础排版 */
        .white-bg h1, .white-bg h2, .white-bg h3, .white-bg h4, .white-bg h5 {
            font-weight: 600;
            margin-top: 1.6em;
            margin-bottom: 0.8em;
        }

        .white-bg p {
            line-height: 1.8;
            margin-bottom: 1em;
            color: #333;
        }

        .white-bg ul, .white-bg ol {
            margin-left: 1.5em;
            margin-bottom: 1em;
        }

        .white-bg a {
            color: #007bff;
            text-decoration: none;
        }
        .white-bg a:hover {
            text-decoration: underline;
        }

        /* 引用块 */
        .white-bg blockquote {
            border-left: 4px solid #007bff;
            padding-left: 15px;
            color: #555;
            margin: 1.2em 0;
            background-color: #f8f9fa;
        }

        /* 代码块 */
        pre {
            background: #282c34;
            color: #f8f8f2;
            border-radius: 8px;
            padding: 16px;
            overflow-x: auto;
            font-family: "Fira Code", "Consolas", monospace;
        }

        code {
            background: #f1f1f1;
            padding: 2px 5px;
            border-radius: 4px;
            font-family: "Fira Code", "Consolas", monospace;
        }

        /* 图片自适应 */
        .white-bg img {
            max-width: 100%;
            height: auto;
            border-radius: 6px;
            margin: 10px 0;
        }

        /* 标题与文章间距 */
        .row {
            justify-content: center;
        }
        </style>
    </head>
    <body>
    
        % include('NAVBAR.tpl')
        <div class="container white-bg">
            <div class="row">
            <h1>{{title}}</h1>
            {{!html}}
            </div>
        </div>
        % include('FOOTER.tpl')
    <script src="/static/js/bootstrap.bundle.js"></script>
    </body>
</html>