-- ===================================================================
-- ARQUIVO X-BR — adiciona a 3ª camada: "teoria da conspiração"
-- Rode isto no SQL Editor do Supabase. Campo opcional — pode ficar
-- vazio nos registros onde não existe uma teoria de encobrimento
-- documentada (ex: pinturas rupestres).
-- ===================================================================

alter table ufologia.casos
  add column if not exists teoria_conspiracao text;

alter table ufologia.relatos_historicos
  add column if not exists teoria_conspiracao text;
