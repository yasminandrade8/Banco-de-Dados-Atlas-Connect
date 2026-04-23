# 🗄️ Banco de Dados - Atlas Connect

Este repositório contém a estrutura, a modelagem e os scripts de banco de dados para o software **Atlas Connect**. O projeto foi desenvolvido utilizando **MySQL** para garantir o armazenamento, a integridade e a consulta eficiente das informações do sistema (como gerenciamento de Usuários, Consultores e Mentorias).

## 🚀 Tecnologias Utilizadas

* **SGBD:** MySQL
* **Linguagem:** SQL (Modelagem DDL, Manipulação DML e Consultas DQL)

## 📂 Estrutura do Repositório

O repositório está organizado da seguinte forma:

* 📁 `Database/`: Diretório dedicado aos scripts do banco de dados.
  * 📄 `consultas.sql`: Arquivo contendo as queries essenciais para a extração de dados e regras de negócio do sistema (inclui filtros por status, agregações e junções entre tabelas).
* 📁 `AtlasConnect-main/`: Diretório contendo os arquivos principais da aplicação que realizam a conexão e a interação com este banco de dados.

## ⚙️ Como executar o projeto

Para rodar este banco de dados localmente em sua máquina, siga os passos abaixo:

1. Certifique-se de ter o **MySQL Server** e uma ferramenta de administração (como o **MySQL Workbench** ou DBeaver) instalados.
2. Faça o clone deste repositório:
   ```bash
   git clone [https://github.com/yasminandrade8/Banco-de-Dados-Atlas-Connect.git](https://github.com/yasminandrade8/Banco-de-Dados-Atlas-Connect.git)
