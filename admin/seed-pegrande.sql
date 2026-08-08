-- ===================================================================
-- ARQUIVO X-BR — entidade Pé-Grande (versão com o mito completo)
-- Rode isto no SQL Editor do Supabase. Usa "on conflict" — funciona
-- tanto se você ainda não rodou seed-pegrande.sql quanto se já rodou
-- (nesse caso, só atualiza os campos).
-- ===================================================================

insert into ufologia.entidades
  (nome, slug, apelido, caso_numero, descricao, primeiro_relato, comportamento, ocorrencia, nivel_ameaca, nivel_ameaca_label, ordem, publicado)
values
  ('Pé-Grande', 'pe-grande', '"Sasquatch" · o críptico que também aparece nos céus', '0761',
   'O nome "Sasquatch" vem de sásq''ets, palavra em halkomelem — língua de povos indígenas da costa noroeste do Pacífico — usada muito antes de qualquer expedição ou documentário sobre o tema. Ali, a figura já fazia parte da tradição oral como um ser da floresta, não como críptico a ser caçado ou provado. O Ocidente só "descobriu" o mito no século XIX, e o popularizou de vez com o filme amador Patterson-Gimlin em 1967 — a filmagem mais citada até hoje, e também a mais contestada. Diferente dos demais crípticos do dossiê, uma parte da pesquisa paranormal soma outra camada: avistamentos de Pé-Grande frequentemente coincidem, na mesma região e período, com relatos de fenômenos aéreos não identificados — levantando a teoria de que não seria um animal desconhecido esperando ser catalogado pela zoologia, mas outra manifestação da mesma porosidade entre dimensões discutida abaixo.',
   'Tradição oral indígena, pré-século XIX · popularizado em 1967', 'Esquivo, desaparece sem rastro', 'moderada', 1, 'baixo, mas alto fator de mistério', 12, true)
on conflict (slug) do update set
  apelido = excluded.apelido,
  caso_numero = excluded.caso_numero,
  descricao = excluded.descricao,
  primeiro_relato = excluded.primeiro_relato,
  comportamento = excluded.comportamento,
  ocorrencia = excluded.ocorrencia,
  nivel_ameaca = excluded.nivel_ameaca,
  nivel_ameaca_label = excluded.nivel_ameaca_label,
  ordem = excluded.ordem,
  publicado = excluded.publicado,
  atualizado_em = now();
