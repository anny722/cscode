const plusButtonQuestion = () => {
const btnsPlusQuestion = document.querySelectorAll(".btn-plus-question");

btnsPlusQuestion.forEach((element) => {
  element.addEventListener('click', event => {
    const themeId = element.getAttribute("data-id");
    const newQuestion = document.querySelector(`#add-question-${themeId}`);
    newQuestion.classList.add('show');
    newQuestion.classList.add('active');
  });
});
};

export { plusButtonQuestion };
