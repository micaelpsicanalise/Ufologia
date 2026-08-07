-- ===================================================================
-- ARQUIVO X-BR — schema Supabase
-- Rode isto no SQL Editor do seu projeto Supabase antes de usar o admin.
-- ===================================================================

create schema if not exists ufologia;

create table if not exists ufologia.entidades (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  slug text not null unique,
  apelido text,
  caso_numero text,
  descricao text,
  primeiro_relato text,
  comportamento text,
  ocorrencia text default 'moderada',
  nivel_ameaca int default 0,
  nivel_ameaca_label text,
  imagem_url text,
  ordem int default 0,
  publicado boolean default false,
  criado_em timestamptz default now(),
  atualizado_em timestamptz default now()
);

create table if not exists ufologia.casos (
  id uuid primary key default gen_random_uuid(),
  ano text not null,
  titulo text not null,
  slug text not null unique,
  descricao text,
  ordem int default 0,
  publicado boolean default false,
  criado_em timestamptz default now(),
  atualizado_em timestamptz default now()
);

-- Row Level Security: leitura pública só do que está publicado,
-- escrita só pra usuários autenticados (quem faz login no admin).
alter table ufologia.entidades enable row level security;
alter table ufologia.casos enable row level security;

create policy "Leitura pública de entidades publicadas"
  on ufologia.entidades for select
  using (publicado = true);

create policy "Leitura/escrita total pra autenticados (entidades)"
  on ufologia.entidades for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

create policy "Leitura pública de casos publicados"
  on ufologia.casos for select
  using (publicado = true);

create policy "Leitura/escrita total pra autenticados (casos)"
  on ufologia.casos for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

-- Depois de rodar isso: Project Settings → API → Exposed schemas →
-- adicione "ufologia" (por padrão só "public" fica exposto).
