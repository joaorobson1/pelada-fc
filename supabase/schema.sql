-- Execute no SQL Editor do Supabase. Nunca coloque a service_role key no front-end.
create extension if not exists pgcrypto;
create table if not exists public.players (
 id uuid primary key default gen_random_uuid(),
 name text not null check(length(trim(name)) between 1 and 100),
 nickname text check(nickname is null or length(nickname)<=60),
 type text not null default 'guest' check(type in ('fixed','guest')),
 created_at timestamptz not null default now()
);
create table if not exists public.peladas (
 id uuid primary key default gen_random_uuid(),
 played_on date not null,
 created_at timestamptz not null default now()
);
create table if not exists public.goals (
 id uuid primary key default gen_random_uuid(),
 pelada_id uuid not null references public.peladas(id) on delete cascade,
 player_id uuid not null references public.players(id) on delete restrict,
 quantity integer not null check(quantity between 0 and 999),
 unique(pelada_id,player_id)
);
-- Adicione manualmente o UUID de cada administrador em auth.users pelo Dashboard.
create table if not exists public.admin_users (
 user_id uuid primary key references auth.users(id) on delete cascade
);
create or replace function public.is_admin() returns boolean language sql stable security definer set search_path = '' as $$
 select exists(select 1 from public.admin_users where user_id = (select auth.uid()));
$$;
revoke all on function public.is_admin() from public;
grant execute on function public.is_admin() to authenticated;
alter table public.players enable row level security;
alter table public.peladas enable row level security;
alter table public.goals enable row level security;
alter table public.admin_users enable row level security;
create policy "players public read" on public.players for select to anon,authenticated using(true);
create policy "peladas public read" on public.peladas for select to anon,authenticated using(true);
create policy "goals public read" on public.goals for select to anon,authenticated using(true);
create policy "players admin insert" on public.players for insert to authenticated with check(public.is_admin());
create policy "players admin update" on public.players for update to authenticated using(public.is_admin()) with check(public.is_admin());
create policy "players admin delete" on public.players for delete to authenticated using(public.is_admin());
create policy "peladas admin insert" on public.peladas for insert to authenticated with check(public.is_admin());
create policy "peladas admin update" on public.peladas for update to authenticated using(public.is_admin()) with check(public.is_admin());
create policy "peladas admin delete" on public.peladas for delete to authenticated using(public.is_admin());
create policy "goals admin insert" on public.goals for insert to authenticated with check(public.is_admin());
create policy "goals admin update" on public.goals for update to authenticated using(public.is_admin()) with check(public.is_admin());
create policy "goals admin delete" on public.goals for delete to authenticated using(public.is_admin());
-- Para adicionar o administrador após criá-lo em Authentication > Users:
-- insert into public.admin_users(user_id) values ('UUID_DO_ADMIN_AQUI');
