<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/static/css/bootstrap.css" rel="stylesheet">
        <link href="/static/css/bgi.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

        <style>
            .thumb { cursor: pointer; }

            #imageModal .modal-dialog {
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0;
                max-width: 100vw;
                width: auto;
                /* ✅ 关键：让对话框本身不吃点击（点击穿透到遮罩层） */
                pointer-events: none;
            }
            #imageModal .modal-content {
                background: transparent;
                border: 0;
                box-shadow: none;
                /* ✅ 关键：内容区可交互（按钮、图片可点） */
                pointer-events: auto;
            }
            #imageModal .modal-body {
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                position: relative;
            }
            #imageModal img {
                max-width: 90vw;
                max-height: 90vh;
                object-fit: contain;
                display: block;
                border-radius: 8px;
                box-shadow: 0 0 20px rgba(0,0,0,0.3);
            }

            /* 翻页按钮半透明悬浮在图片两侧 */
            .nav-btn {
                position: absolute;
                top: 50%;
                transform: translateY(-50%);
                width: 48px;
                height: 48px;
                border-radius: 50%;
                border: none;
                background: rgba(0, 0, 0, 0.5);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0.8;
                transition: opacity 0.2s, background 0.2s;
                pointer-events: auto; /* 确保按钮可点 */
            }
            .nav-btn:hover {
                opacity: 1;
                background: rgba(0, 0, 0, 0.7);
            }
            #prevImage { left: 16px; }
            #nextImage { right: 16px; }
        </style>
    </head>
    <body>
        % include('NAVBAR.tpl')
        <div class="container">
            <div class="row my-masonry">
                % for item in album:
                <div class="masonry-item mb-3 col-lg-3 col-md-4 col-sm-4 col-xs-6">
                    <img src="/static/thumb/{{item}}" 
                         alt="a cool photo" 
                         class="img-fluid thumb" 
                         data-fullsize="/static/album/{{item}}">
                </div>
                % end
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="imageModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <img id="modalImage" src="" alt="Original Image" class="img-fluid">

                        <!-- 翻页按钮 -->
                        <button class="nav-btn" id="prevImage"><i class="bi bi-chevron-left fs-4"></i></button>
                        <button class="nav-btn" id="nextImage"><i class="bi bi-chevron-right fs-4"></i></button>
                    </div>
                </div>
            </div>
        </div>

        <script src="/static/js/bootstrap.bundle.js"></script>
        <script src="/static/js/masonry.pkgd.min.js"></script>
        <script src="/static/js/imagesloaded.pkgd.min.js"></script>
        <script>
            var grid = document.querySelector('.my-masonry');
            var msnry = new Masonry(grid, { itemSelector: '.masonry-item', percentPosition: true });
            imagesLoaded(grid, function() { msnry.layout(); });

            var thumbnails = document.querySelectorAll('.thumb');
            var modalImage = document.getElementById('modalImage');
            var currentIndex = -1;
            var imageModalEl = document.getElementById('imageModal');
            var imageModal = new bootstrap.Modal(imageModalEl);

            thumbnails.forEach(function(thumb, index) {
                thumb.addEventListener('click', function() {
                    currentIndex = index;
                    modalImage.src = thumb.getAttribute('data-fullsize');
                    imageModal.show();
                });
            });

            function showImage(index) {
                currentIndex = (index + thumbnails.length) % thumbnails.length; // 循环
                modalImage.src = thumbnails[currentIndex].getAttribute('data-fullsize');
            }
            document.getElementById('prevImage').addEventListener('click', function(e) {
                e.stopPropagation(); // 阻止冒泡，避免关闭
                showImage(currentIndex - 1);
            });
            document.getElementById('nextImage').addEventListener('click', function(e) {
                e.stopPropagation();
                showImage(currentIndex + 1);
            });

            /* ✅ 兜底：点击 modal-body 的空白处关闭（不影响图片和按钮） */
            document.querySelector('#imageModal .modal-body').addEventListener('click', function(e){
                if (e.target === this) { // 点击在空白处而不是图片/按钮
                    imageModal.hide();
                }
            });
        </script>
        % include('FOOTER.tpl')
    </body>
</html>
