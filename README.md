# Pelada FC — MVP React

Aplicação responsiva com sorteio público, três times de seis jogadores, convidados temporários, ranking, histórico e painel administrativo.

## Requisitos

- Node.js 20.19+ ou 22.12+
- npm
- Projeto Supabase para cadastro e artilharia oficiais

## Executar

```bash
npm install
cp .env.example .env
npm run dev
```

No Windows PowerShell, use `Copy-Item .env.example .env` em vez de `cp` se preferir.
Abra a URL exibida pelo Vite (geralmente http://localhost:5173).

## Configurar Supabase

1. Crie um projeto Supabase.
2. Abra SQL Editor e execute `supabase/schema.sql`.
3. Em Project Settings / API, copie a Project URL e a chave pública **anon/publishable**.
4. Preencha `.env` com `VITE_SUPABASE_URL` e `VITE_SUPABASE_ANON_KEY`.
5. Em Authentication > Users, crie um usuário administrador com e-mail e senha.
6. Copie o UUID do usuário e execute no SQL Editor:

```sql
insert into public.admin_users(user_id) values ('COLE_AQUI_O_UUID');
```

7. Reinicie `npm run dev` após alterar `.env`.

**Nunca use a chave `service_role` no front-end.** O SQL habilita RLS, leitura pública e gravação apenas por administradores autorizados.

## Regras

- Cada navegador mantém seu sorteio em `localStorage`, sem login.
- Cada time recebe no máximo 6 jogadores; um jogador não pode aparecer duas vezes no mesmo sorteio.
- Convidados digitados no sorteio são **temporários**, não entram no banco nem na artilharia automaticamente.
- Somente admin cadastra jogadores oficiais e resultados.
- Jogadores fixos e convidados oficiais mantêm seus gols ao longo das partidas.
- Para registrar presença sem gols, admin informa 0 para o jogador participante; campos em branco significam ausência.
- O histórico e ranking são calculados a partir das tabelas oficiais.

## Limitações da primeira versão

- Sorteios são locais e não compartilhados em tempo real.
- Ainda não há PWA/offline completo, testes automatizados ou implantação na Vercel.
- A gravação/edição de resultados usa chamadas sequenciais; para consistência transacional completa em produção, migrar para uma função RPC no Postgres.
- Não existe vínculo automático entre um sorteio local e uma edição oficial da pelada.
- Jogadores convidados temporários que marcarem gols precisam ser cadastrados pelo admin antes do lançamento dos resultados.

## Produção

Execute `npm run build` e publique a pasta `dist` na Vercel (framework Vite). Configure as mesmas variáveis de ambiente na hospedagem.
