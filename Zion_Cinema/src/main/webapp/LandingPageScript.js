document.addEventListener("DOMContentLoaded", function () {
    const slides = document.querySelectorAll('.slide'); // All slides
    const carouselSlides = document.querySelector('.carousel-slides'); // Carousel container

    // Clone the first and last slides for smooth looping
    const firstClone = slides[0].cloneNode(true);
    const lastClone = slides[slides.length - 1].cloneNode(true);

    // Append and prepend clones
    carouselSlides.appendChild(firstClone); // Append first slide clone at the end
    carouselSlides.insertBefore(lastClone, slides[0]); // Prepend last slide clone at the beginning

    const totalSlides = slides.length + 2; // Total slides including clones
    let currentIndex = 1; // Start at the first original slide
    let isTransitioning = false; // Prevent multiple transitions

    // Set initial position
    carouselSlides.style.transform = `translateX(-${currentIndex * 100}%)`;

    // Function to update slide position
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
        if (isTransitioning) return; // Prevent multiple transitions
        currentIndex++;
        showSlide(currentIndex);
    }

    // Automatic slide transition every 3 seconds
    let autoSlide = setInterval(nextSlide, 3000);

    // Prevent long-term issues by restarting `setInterval` periodically
    setInterval(() => {
        clearInterval(autoSlide);
        autoSlide = setInterval(nextSlide, 3000);
    }, 60000); // Restart every 60 seconds to avoid potential timer drift
});

