const btnMobile = document.getElementById('btn-mobile');
const nav = document.getElementById('nav');

const btnPaises = document.querySelector('#menu-paises > a');
const dropPaises = document.getElementById('dropdown-paises');

const btnLogin = document.querySelector('#menu-login > a');
const dropLogin = document.getElementById('dropdown-login');

// Abrir/Fechar Menu Mobile
btnMobile.addEventListener('click', (e) => {
    e.stopPropagation(); 
    nav.classList.toggle('active');
});

// Função para Dropdowns
function configurarDropdown(botao, caixa, outraCaixa) {
    if(!botao) return;
    botao.addEventListener('click', (e) => {
        e.preventDefault();
        e.stopPropagation();
        if (outraCaixa) outraCaixa.classList.remove('show');
        caixa.classList.toggle('show');
    });
}

configurarDropdown(btnPaises, dropPaises, dropLogin);
configurarDropdown(btnLogin, dropLogin, dropPaises);


window.addEventListener('click', (e) => {
    if (!nav.contains(e.target) && !btnMobile.contains(e.target)) {
        nav.classList.remove('active');
        dropPaises.classList.remove('show');
        if (dropLogin) dropLogin.classList.remove('show');
    }
});

async function carregarConsultores() {
    const container = document.querySelector('.stack-container');
    if (!container) return;

    try {
        const response = await fetch('http://localhost:3000/api/consultores');
        const consultores = await response.json();

        // Limpa o conteúdo estático para colocar o do banco
        container.innerHTML = '';

        consultores.forEach((c, index) => {
            const cores = ['bg-yale', 'bg-horizon', 'bg-gold'];
            const card = `
                <div class="sticky-card ${cores[index % 3]}" id="consultor-${c.id}">
                    <div class="card-visual">
                        <img src="assets/images/${c.imagem}" alt="${c.nome}" class="consultor-photo">
                    </div>
                    <div class="card-text">
                        <h3>${c.nome}</h3>
                        <p class="specialty-title">${c.especialidade}</p>
                        <p class="bio-text">${c.bio}</p>
                        <div class="flag-group">
                            <img src="assets/images/${c.bandeira}" alt="País" class="flag-icon">
                        </div>
                        <div class="card-cta">
                            <a href="#" class="btn-outline-white">Agendar Consultoria</a>
                        </div>
                    </div>
                </div>
            `;
            container.innerHTML += card;
        });
    } catch (err) {
        console.error("Erro ao carregar consultores do SQLite:", err);
    }
}

document.addEventListener('DOMContentLoaded', carregarConsultores);
