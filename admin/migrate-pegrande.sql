-- ===================================================================
-- ARQUIVO X-BR — move o Pé-Grande de "entidades" pra "criptideos"
-- Rode isto DEPOIS de schema-criptideos.sql.
-- ===================================================================

insert into ufologia.criptideos
  (nome, slug, apelido, caso_numero, descricao, primeiro_relato, comportamento, ocorrencia, nivel_ameaca, nivel_ameaca_label, imagem_url, ordem, publicado)
select
  nome, slug, apelido, caso_numero, descricao, primeiro_relato, comportamento, ocorrencia, nivel_ameaca, nivel_ameaca_label, imagem_url, 1, publicado
from ufologia.entidades
where slug = 'pe-grande'
on conflict (slug) do nothing;

delete from ufologia.entidades where slug = 'pe-grande';
