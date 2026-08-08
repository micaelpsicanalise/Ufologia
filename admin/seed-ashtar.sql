-- ===================================================================
-- ARQUIVO X-BR — Ashtar Command / contatismo espírita-ufológico
-- Rode isto no SQL Editor do Supabase (depois do seed-conspiracao.sql).
-- ===================================================================

insert into ufologia.relatos_historicos
  (era, titulo, slug, periodo, local, descricao, teoria_conspiracao, ordem, publicado)
values
  ('Era moderna (contatismo)', 'Comando Ashtar', 'comando-ashtar',
   'Desde 1952 (EUA); grande expansão a partir dos anos 1980 no Brasil',
   'Giant Rock, Califórnia (EUA) · difusão global, forte presença no Brasil',
   'Em 1952, o contactado americano George Van Tassel afirmou ter recebido, por telepatia, a primeira mensagem de "Ashtar" — um comandante de uma frota cósmica dedicada a orientar a humanidade. A partir daí, dezenas de médiuns ao redor do mundo passaram a alegar contato independente com a mesma entidade (também chamada Ashtar Sheran), formando uma mitologia coletiva sem organização central — estudada pela academia como uma "religião OVNI". No Brasil, esse tipo de contatismo espírita-ufológico ganhou força própria a partir dos anos 1980, e algumas correntes somaram à mistura elementos de cavalaria medieval: o Vale do Amanhecer, por exemplo, consagra médiuns como "Cavaleiros", em rituais que remetem à mitologia arturiana e templária, dentro de uma cosmologia que já combinava espiritismo, cristianismo, religiões afro-brasileiras e símbolos egípcios. É um dos exemplos mais claros de como o imaginário ufológico e a tradição mediúnica se fundiram em algo essencialmente novo.',
   null, 8, true)
on conflict (slug) do update set
  descricao = excluded.descricao,
  periodo = excluded.periodo,
  local = excluded.local;
