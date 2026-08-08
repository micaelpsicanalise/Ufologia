-- ===================================================================
-- ARQUIVO X-BR — camada histórica e pré-histórica
-- Rode isto no SQL Editor do Supabase (cria a tabela + policies +
-- grants, seguindo o mesmo padrão de entidades/casos).
-- ===================================================================

create table if not exists ufologia.relatos_historicos (
  id uuid primary key default gen_random_uuid(),
  era text not null,
  titulo text not null,
  slug text not null unique,
  periodo text,
  local text,
  descricao text,
  ordem int default 0,
  publicado boolean default false,
  criado_em timestamptz default now(),
  atualizado_em timestamptz default now()
);

alter table ufologia.relatos_historicos enable row level security;

create policy "Leitura pública de relatos históricos publicados"
  on ufologia.relatos_historicos for select
  using (publicado = true);

create policy "Leitura/escrita total pra autenticados (relatos históricos)"
  on ufologia.relatos_historicos for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

grant select on ufologia.relatos_historicos to anon;
grant select, insert, update, delete on ufologia.relatos_historicos to authenticated;
