<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link href="/static/css/bootstrap.css" rel="stylesheet">
        <link href="/static/css/bgi.css" rel="stylesheet">

        <style>
            /* 1. Hand cursor on hover */
            .thumb {
                cursor: pointer;
            }
            #imageModal .modal-dialog {
                display: flex;             
                align-items: center;       /* 垂直居中 */
                justify-content: center;   /* 水平居中 */
                margin: 0;                 
                max-width: 100vw;
                width: auto;
            }

            #imageModal .modal-content {
                background: #fff;          /* 保持白色背景 */
                border-radius: 8px;        /* 圆角 */
                padding: 8px;              /* 内边距，让图片和边框有间隔 */
                box-shadow: 0 0 20px rgba(0,0,0,0.3); /* 阴影，让 modal 浮起来 */
                width: auto;               /* 随图片大小 */
                display: inline-block;
            }

            #imageModal .modal-body {
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
            }

            #imageModal img {
                max-width: 90vw;
                max-height: 90vh;
                object-fit: contain;
                display: block;
            }
        </style>
    </head>
    <body>
        % include('NAVBAR.tpl')
        <div class="container">
            <div class="row my-masonry">
                % for item in album:
                <div class="masonry-item mb-3 col-lg-3 col-md-4 col-sm-4 col-xs-6">
                    <img src="/static/thumb/{{item}}" alt="a cool photo" class="img-fluid thumb" data-fullsize="/static/album/{{item}}">
                </div>
                % end
            </div>
        </div>

        <!-- Modal for viewing the original image -->
        <div class="modal fade" id="imageModal" tabindex="-1" aria-labelledby="imageModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <img id="modalImage" src="" alt="Original Image" class="img-fluid">
                    </div>
                </div>
            </div>
        </div>

        <script src="/static/js/bootstrap.bundle.js"></script>
        <script src="/static/js/masonry.pkgd.min.js"></script>
        <script src="/static/js/imagesloaded.pkgd.min.js"></script>
        <script>
            var grid = document.querySelector('.my-masonry');
            var msnry = new Masonry(grid, {
                itemSelector: '.masonry-item',
                percentPosition: true,
            });
            imagesLoaded(grid, function() {
                msnry.layout();
            });

            // Add click event to thumbnails
            var thumbnails = document.querySelectorAll('.thumb');
            thumbnails.forEach(function(thumb) {
                thumb.addEventListener('click', function() {
                    var fullSizeImage = thumb.getAttribute('data-fullsize');
                    var modalImage = document.getElementById('modalImage');
                    modalImage.src = fullSizeImage;

                    var imageModal = new bootstrap.Modal(document.getElementById('imageModal'));
                    imageModal.show();
                });
            });
        </script>
        % include('FOOTER.tpl')
    </body>
</html>
