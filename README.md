# ⚽ Pelada FC

**Organize sua pelada, sorteie os times e acompanhe a disputa pela artilharia.**

O **Pelada FC** é uma aplicação web desenvolvida para facilitar a organização de partidas de futebol entre amigos. A plataforma oferece sorteio automático de equipes, gerenciamento de jogadores, registro de gols e acompanhamento de estatísticas.

O projeto foi desenvolvido com foco em simplicidade, responsividade e facilidade de uso, permitindo que os participantes acessem as funcionalidades diretamente pelo navegador, tanto no computador quanto no celular.

## 🚀 Funcionalidades

### 🎲 Sorteio de times

- Sorteio aleatório de jogadores entre três equipes: **Azul, Amarelo e Preto**.
- Distribuição equilibrada de até **18 jogadores**, com limite de seis por equipe.
- Seleção de jogadores previamente cadastrados.
- Inclusão de convidados temporários.
- Prevenção de jogadores duplicados no mesmo sorteio.
- Reinicialização e realização de novos sorteios.
- Acesso público, sem necessidade de autenticação.

### 🏆 Ranking de artilheiros

- Classificação dos jogadores por quantidade de gols.
- Atualização do ranking com base nos resultados registrados.
- Histórico acumulado de gols.
- Consulta pública à classificação.

### 👥 Gerenciamento de jogadores

- Cadastro de jogadores fixos e convidados.
- Identificação individual de cada participante.
- Gerenciamento dos cadastros pelo administrador.
- Preservação do histórico individual de gols.
- Possibilidade de transformar convidados em jogadores fixos.

### 📅 Histórico de partidas

- Registro das datas das peladas.
- Associação dos gols aos respectivos jogadores.
- Consulta aos resultados anteriores.
- Organização dos registros por partida.

### 🔐 Painel administrativo

- Autenticação utilizando Supabase Auth.
- Gerenciamento de jogadores.
- Registro e atualização de gols.
- Controle de acesso às operações administrativas.
- Proteção de dados por meio de políticas Row Level Security (RLS).

## 🛠️ Tecnologias utilizadas

| Tecnologia | Finalidade |
|---|---|
| React | Construção da interface |
| TypeScript | Tipagem estática e organização do código |
| Vite | Ambiente de desenvolvimento e build |
| Tailwind CSS | Estilização e responsividade |
| Supabase | Banco de dados e autenticação |
| PostgreSQL | Armazenamento relacional |
| Git e GitHub | Versionamento de código |
| Vercel | Hospedagem e deploy |

## 📁 Estrutura do projeto

```text
pelada-fc/
├── public/
├── src/
│   ├── components/
│   ├── pages/
│   ├── hooks/
│   ├── services/
│   ├── types/
│   ├── utils/
│   └── App.tsx
├── supabase/
│   └── schema.sql
├── .env.example
├── .gitignore
├── index.html
├── package.json
└── vite.config.ts
```

*A estrutura pode variar conforme a evolução do projeto.*

## ⚙️ Instalação e execução

### Pré-requisitos

- Node.js
- npm
- Git
- Projeto configurado no Supabase

### 1. Clone o repositório

```bash
git clone https://github.com/SEU-USUARIO/pelada-fc.git
```

### 2. Acesse o diretório

```bash
cd pelada-fc
```

### 3. Instale as dependências

```bash
npm install
```

### 4. Configure as variáveis de ambiente

Crie um arquivo `.env` na raiz do projeto:

```env
VITE_SUPABASE_URL=https://SEU-PROJETO.supabase.co
VITE_SUPABASE_ANON_KEY=SUA_CHAVE_PUBLICA
```

As credenciais públicas podem ser encontradas nas configurações do projeto no Supabase.

**Segurança:** nunca exponha chaves `service_role` ou `secret` no código do front-end. O arquivo `.env` não deve ser enviado ao repositório.

### 5. Configure o banco de dados

1. Acesse o painel do Supabase.
2. Abra o **SQL Editor**.
3. Execute o script disponível em `supabase/schema.sql`.
4. Configure um usuário administrador em **Authentication**.
5. Vincule o identificador do usuário à tabela `admin_users`.

### 6. Inicie o servidor

```bash
npm run dev
```

A aplicação estará disponível no endereço informado pelo Vite, normalmente:

```text
http://localhost:5173
```

### 7. Gere a versão de produção

```bash
npm run build
```

Os arquivos de produção serão gerados no diretório `dist/`.

## 🔒 Permissões e segurança

O sistema utiliza dois níveis de acesso:

**Usuário público**

Pode realizar sorteios, selecionar jogadores, adicionar convidados temporários e consultar informações públicas.

**Administrador**

Possui acesso às funcionalidades de gerenciamento, incluindo cadastro oficial de jogadores, registro de gols e manutenção do histórico.

O controle de acesso aos dados é realizado por meio do Supabase Auth e das políticas de segurança do PostgreSQL.

## ☁️ Deploy

O projeto foi estruturado para publicação na **Vercel**, com integração ao GitHub.

Para realizar o deploy:

1. Importe o repositório na Vercel.
2. Selecione o framework Vite.
3. Configure as variáveis de ambiente do Supabase.
4. Execute a implantação.

As alterações enviadas à branch principal podem gerar novas versões automaticamente.

## 🗺️ Roadmap

- [x] Estrutura inicial com React e TypeScript.
- [x] Sorteio aleatório de equipes.
- [x] Suporte a jogadores fixos e convidados.
- [x] Estrutura de banco de dados no Supabase.
- [x] Integração inicial com autenticação.
- [ ] Validar integralmente os fluxos administrativos.
- [ ] Implementar sorteios compartilhados em tempo real.
- [ ] Adicionar estatísticas individuais avançadas.
- [ ] Implementar ranking por temporada.
- [ ] Adicionar histórico das equipes sorteadas.
- [ ] Disponibilizar instalação como PWA.
- [ ] Aprimorar a experiência mobile.

## 🤝 Contribuições

Sugestões, melhorias e contribuições são bem-vindas.

Para contribuir, abra uma *issue* descrevendo sua proposta ou envie um *pull request* com as alterações.

## 📄 Licença

Licença ainda não definida.

---

**Pelada FC** — Mais organização dentro e fora de campo. ⚽