<footer class="bg-dark text-light pt-4 pb-3">
    <div class="container bg-dark text-white">
        <div class="row">
        <!-- About -->
        <div class="col-md-5 mb-3">
            <h5>About Us</h5>
            <p>
            In golf, an "eagle" represents excellence, ambition, and skill. The Boston Eaglets Club is all about fostering a love for golf by building a fun, supportive community.
            </p>
        </div>

        <!-- Links -->
        <div class="col-md-3 offset-md-1 mb-3">
            <h5>Quick Links</h5>
            <ul class="list-unstyled">
                % for item in NAVBAR:
                <li><a href="{{ item['url'] }}" class="text-light text-decoration-none">{{item['name']}}</a></li>
                % end
            </ul>
        </div>

        <!-- Contact / Social -->
        <div class="col-md-3 mb-3">
            <h5>Contact</h5>
            <p>Email: <a href="mailto:spiolet3456@gmail.com " class="text-light">spiolet3456@gmail.com </a></p>
            <p>Email: <a href="mailto:brianlixl2009@gmail.com " class="text-light">brianlixl2009@gmail.com </a></p>
        </div>
        </div>
        <hr class="border-secondary">
        <div class="text-center">
        <small>&copy; 2025 Boston Eaglets Club. All rights reserved.</small>
        </div>
    </div>
</footer>