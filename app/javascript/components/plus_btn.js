const toggleButton = () => {
const btnPlusTheme = document.querySelector(".btn-plus-theme");
const newTheme = document.querySelector('.for-new-theme');
const btnsPlusQuestion = document.querySelectorAll(".btn-plus-question");

btnPlusTheme.addEventListener('click', event => {
  newTheme.classList.add('show');
  newTheme.classList.add('active');
});
btnsPlusQuestion.forEach((element) => {
  element.addEventListener('click', event => {
    const themeId = element.getAttribute("data-id");
    const newQuestion = document.querySelector(`#add-question-${themeId}`);
    newQuestion.classList.add('show');
    newQuestion.classList.add('active');
  });
}}
);

export { toggleButton };
