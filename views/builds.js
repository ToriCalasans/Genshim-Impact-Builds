//Criar personagem
const genshimBuild = {
    personagens: [{
        ID: '',
        NOME: '',
        ID_TALENTO: '',
        PHOTO_URL: '',
    }],
    armas: [{
        ID: '',
        NOME: '',
        PHOTO_URL: ''
    }],
    artefatos: [{
        ID: '',
        NOME: '',
        ID_STATUS: '',
        PHOTO_URL: ''
    }]

};

function cadastrarPersonagem(dados) {
    genshimBuild.personagens.push({
        id: dados.ID,
        nome: dados.NOME,
        foto: dados.PHOTO_URL,

    })
}

cadastrarPersonagem({
    id: genshimBuild.personagens.length +1,
    nome: 'Zhongli',
    foto: './images/Zhongli-Splash-Art.pgn'
});

//Ler personagem
function listarPesonagem() {
    return genshimBuild.personagens;
}

//Update personagem
function atualizaPersonagem(id, nome, foto) {
    const personagemAtualizado = atualizaPersonagem().find((post) =>{
        return post.ID === id;
    });
    personagemAtualizado.nome = nome;
    personagemAtualizado.foto = foto;
}
atualizaPersonagem(1, 'Diluc', './images/Diluc-Splash-Art.pgn')

//Deletar personagem

function apagaPersonagem(id){
    const apagarPersonagem = find
}