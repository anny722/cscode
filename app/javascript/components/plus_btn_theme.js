const plusButtonTheme = () => {
  const btnPlusTheme = document.querySelector(".btn-plus-theme");
    if (typeof(btnPlusTheme) != 'undefined' && btnPlusTheme != null){
      const newTheme = document.querySelector('.for-new-theme');
      btnPlusTheme.addEventListener('click', event => {
      newTheme.classList.add('show');
      newTheme.classList.add('active');
    });
  };
}
export { plusButtonTheme };
