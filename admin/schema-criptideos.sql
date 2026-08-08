-- ===================================================================
-- ARQUIVO X-BR — Animais Criptídeos (nova categoria, separada de
-- "entidades" — essa aqui é pra bichos, não seres alienígenas)
-- Rode isto no SQL Editor do Supabase.
-- ===================================================================

create table if not exists ufologia.criptideos (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  slug text not null unique,
  apelido text,
  caso_numero text,
  descricao text,
  teoria_conspiracao text,
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

alter table ufologia.criptideos enable row level security;

create policy "Leitura pública de criptídeos publicados"
  on ufologia.criptideos for select
  using (publicado = true);

create policy "Leitura/escrita total pra autenticados (criptídeos)"
  on ufologia.criptideos for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

grant select on ufologia.criptideos to anon;
grant select, insert, update, delete on ufologia.criptideos to authenticated;
