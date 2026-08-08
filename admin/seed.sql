-- ===================================================================
-- ARQUIVO X-BR — seed com o conteúdo que já existia na home
-- Rode isto no SQL Editor do Supabase DEPOIS do schema.sql e do
-- fix-grants.sql. Popula as tabelas pra você poder editar no admin
-- sem perder o que já estava no site.
-- ===================================================================

insert into ufologia.entidades
  (nome, slug, apelido, caso_numero, descricao, primeiro_relato, comportamento, ocorrencia, nivel_ameaca, nivel_ameaca_label, ordem, publicado)
values
  ('Cinzentos', 'cinzentos', '"Greys" · o arquétipo clássico', '0447',
   'Baixa estatura, pele acinzentada, cabeça grande e olhos escuros amendoados. O tipo mais citado desde o caso Roswell 1947, associado a relatos de abdução e exames.',
   '1947, EUA', 'Observador / clínico', 'muito_alta', 2, 'baixo', 1, true),

  ('Reptilianos', 'reptilianos', '"Draconianos" · figura de teoria da conspiração', '1102',
   'Humanoides com traços répteis, associados por teóricos a controle de instituições e famílias de elite. Sem qualquer relato de contato direto verificável — praticamente todo o material vem de segunda mão.',
   'Anos 1980, folclore', 'Camuflado / infiltrado', 'baixa', 4, 'alto (não verificado)', 2, true),

  ('Nórdicos', 'nordicos', '"Pleiadianos" · contato benevolente', '0289',
   'Aparência humana, altos, loiros, olhos claros. Figuram em relatos de "contactados" das décadas de 1950–70, que descrevem mensagens de paz e alertas sobre a humanidade.',
   '1952, contactismo', 'Comunicativo', 'moderada', 1, 'nenhum', 3, true),

  ('Mantídeos', 'mantideos', '"Mantis" · forma insectoide', '0733',
   'Descritos como altos, magros, com traços de louva-a-deus. Aparecem com menor frequência, geralmente em relatos que envolvem comunicação telepática e presença junto a Cinzentos.',
   'Anos 1990, abduções', 'Distante / hierárquico', 'rara', 2, 'incerto', 4, true),

  ('Homens de Preto', 'homens-de-preto', '"MIB" · não classificados como alienígenas', '0016',
   'Figuras humanas em ternos escuros que, segundo relatos, visitam testemunhas de avistamentos para intimidá-las ao silêncio. Origem controversa — teoria vai de agentes governamentais a algo mais estranho.',
   '1953, EUA', 'Ameaçador / evasivo', 'moderada', 3, 'médio', 5, true),

  ('Vultos / Sombras', 'vultos-sombras', '"Shadow People" · fronteira com o paranormal', '0958',
   'Silhuetas escuras e sem detalhes, frequentemente relatadas em quartos à noite. Sobrepõe-se a relatos de paralisia do sono, o que torna esse o caso mais debatido entre ufologia e psicologia popular.',
   'Difuso, folclore antigo', 'Observador silencioso', 'alta', 2, 'baixo, alto fator de medo', 6, true);

insert into ufologia.casos
  (ano, titulo, slug, descricao, ordem, publicado)
values
  ('1947', 'Avistamento de Kenneth Arnold', 'avistamento-kenneth-arnold',
   'Piloto relata nove objetos voando em formação perto do Monte Rainier, EUA. A imprensa cunha o termo "disco voador" a partir de sua descrição.', 1, true),

  ('1947', 'Incidente de Roswell', 'incidente-de-roswell',
   'Destroços encontrados em um rancho no Novo México geram o caso mais citado da ufologia, alimentado por décadas de versões contraditórias e teorias de encobrimento.', 2, true),

  ('1980', 'Floresta de Rendlesham', 'floresta-de-rendlesham',
   'Militares da força aérea dos EUA baseados no Reino Unido relatam luzes e um objeto pousado na floresta — considerado um dos casos mais bem documentados por testemunhas militares.', 3, true),

  ('1997', 'Luzes de Phoenix', 'luzes-de-phoenix',
   'Milhares de pessoas no Arizona relatam luzes em formação de V cruzando o céu noturno, em um dos avistamentos em massa mais famosos dos EUA.', 4, true),

  ('2004', 'Vídeo "Tic Tac" da Marinha dos EUA', 'video-tic-tac-marinha-eua',
   'Pilotos de caça registram um objeto sem asas nem motores visíveis realizando manobras consideradas incompatíveis com aeronaves conhecidas.', 5, true),

  ('2021', 'Relatório do Pentágono sobre UAPs', 'relatorio-pentagono-uaps',
   'O governo dos EUA divulga um relatório oficial reconhecendo dezenas de casos de "fenômenos anômalos não identificados" sem explicação convencional definitiva.', 6, true);
