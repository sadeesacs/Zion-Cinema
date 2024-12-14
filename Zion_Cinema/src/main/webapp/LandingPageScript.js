//Carasoul Function
document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll('.slide'); 
    const carouselSlides = document.querySelector('.carousel-slides'); 

    const firstClone = slides[0].cloneNode(true);
    const lastClone = slides[slides.length - 1].cloneNode(true);

    carouselSlides.appendChild(firstClone);
    carouselSlides.insertBefore(lastClone, slides[0]); 

    const totalSlides = slides.length + 2; 
    let currentIndex = 1; 
    let isTransitioning = false; 

    carouselSlides.style.transform = `translateX(-${currentIndex * 100}%)`;

    function showSlide(index) {
        isTransitioning = true;
        carouselSlides.style.transition = 'transform 0.5s ease-in-out';
        carouselSlides.style.transform = `translateX(-${index * 100}%)`;
    }

    // Handle transition end for looping
    carouselSlides.addEventListener('transitionend', () => {
        if (currentIndex === 0) {
            carouselSlides.style.transition = 'none'; // Disable animation
            currentIndex = totalSlides - 2; // Move to the last original slide
            carouselSlides.style.transform = `translateX(-${currentIndex * 100}%)`;
        } else if (currentIndex === totalSlides - 1) {
            carouselSlides.style.transition = 'none'; // Disable animation
            currentIndex = 1; // Move to the first original slide
            carouselSlides.style.transform = `translateX(-${currentIndex * 100}%)`;
        }
        isTransitioning = false; // Reset transitioning state
    });

    // Function to move to the next slide automatically
    function nextSlide() {
        if (isTransitioning) return; 
        currentIndex++;
        showSlide(currentIndex);
    }

    let autoSlide = setInterval(nextSlide, 3000);

    // Prevent long-term issues by restarting `setInterval` periodically
    setInterval(() => {
        clearInterval(autoSlide);
        autoSlide = setInterval(nextSlide, 3000);
    }, 60000); 
});



//Movie listing section function
document.addEventListener("DOMContentLoaded", () => {
    const nowShowingBtn = document.getElementById("now-showing-btn");
    const comingSoonBtn = document.getElementById("coming-soon-btn");

    const nowShowingMovies = document.querySelectorAll('.movie-card[class="movie-card Now Showing"]');
    const comingSoonMovies = document.querySelectorAll('.movie-card[class="movie-card Coming Soon"]');

    // Set default state: Show "Now Showing" movies and hide "Coming Soon"
    nowShowingMovies.forEach((movie) => (movie.style.display = "block"));
    comingSoonMovies.forEach((movie) => (movie.style.display = "none"));

    // Add active class to the currently selected button (optional)
    nowShowingBtn.classList.add("active");

    // Button click events
    nowShowingBtn.addEventListener("click", () => {
        nowShowingMovies.forEach((movie) => (movie.style.display = "block"));
        comingSoonMovies.forEach((movie) => (movie.style.display = "none"));

        nowShowingBtn.classList.add("active");
        comingSoonBtn.classList.remove("active");
    });

    comingSoonBtn.addEventListener("click", () => {
        nowShowingMovies.forEach((movie) => (movie.style.display = "none"));
        comingSoonMovies.forEach((movie) => (movie.style.display = "block"));

        comingSoonBtn.classList.add("active");
        nowShowingBtn.classList.remove("active");
    });
});


