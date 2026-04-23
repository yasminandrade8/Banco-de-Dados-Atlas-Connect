const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(cors());
app.use(express.json());

// Configuração da conexão (Use a senha que você definiu no MySQL Installer)
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'admin', 
    database: 'AtlasConnect'
});

db.connect(err => {
    if (err) {
        console.error('Erro ao conectar ao MySQL:', err.message);
        return;
    }
    console.log('Conectado ao banco AtlasConnect!');
});

// Rota para listar consultores (Usada pelo seu script.js)
app.get('/api/consultores', (req, res) => {
    const sql = "SELECT * FROM Consultor WHERE status = 'Aprovado'";
    db.query(sql, (err, results) => {
        if (err) return res.status(500).json(err);
        res.json(results);
    });
});

app.post('/register', (req, res) => {
    const { email, password } = req.body;
    
    // Como a tabela Usuario exige nomeUsuario, usamos um valor padrão
    const sql = "INSERT INTO Usuario (nomeUsuario, email, senha) VALUES (?, ?, ?)";
    const nomePadrao = "Usuário Atlas";

    db.query(sql, [nomePadrao, email, password], (err, result) => {
        if (err) {
            console.error("Erro ao inserir no banco:", err.message);
            return res.status(500).json({ error: "Erro ao salvar no banco" });
        }
        console.log("Usuário cadastrado com sucesso!");
        res.status(201).json({ success: true });
    });
});

app.listen(3000, () => {
    console.log('Servidor rodando na porta 3000');
});