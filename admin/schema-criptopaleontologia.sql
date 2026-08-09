-- ===================================================================
-- ARQUIVO X-BR — Criptopaleontologia (teorias marginais sobre fósseis)
-- Rode isto no SQL Editor do Supabase.
-- ===================================================================

create table if not exists ufologia.criptopaleontologia (
  id uuid primary key default gen_random_uuid(),
  titulo text not null,
  slug text not null unique,
  categoria text not null,
  periodo text,
  descricao text,
  teoria_conspiracao text,
  ordem int default 0,
  publicado boolean default false,
  criado_em timestamptz default now(),
  atualizado_em timestamptz default now()
);

alter table ufologia.criptopaleontologia enable row level security;

create policy "Leitura pública de criptopaleontologia publicada"
  on ufologia.criptopaleontologia for select
  using (publicado = true);

create policy "Leitura/escrita total pra autenticados (criptopaleontologia)"
  on ufologia.criptopaleontologia for all
  using (auth.role() = 'authenticated')
  with check (auth.role() = 'authenticated');

grant select on ufologia.criptopaleontologia to anon;
grant select, insert, update, delete on ufologia.criptopaleontologia to authenticated;
