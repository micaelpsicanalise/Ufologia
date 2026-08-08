-- ===================================================================
-- ARQUIVO X-BR — seed da camada histórica e pré-histórica
-- Rode isto DEPOIS de schema-historicos.sql.
-- ===================================================================

insert into ufologia.relatos_historicos
  (era, titulo, slug, periodo, local, descricao, ordem, publicado)
values
  ('Pré-história', 'Pinturas de Val Camonica', 'pinturas-val-camonica',
   '~10.000 a.C.', 'Val Camonica, Itália',
   'Gravuras rupestres que incluem figuras humanoides com formas ao redor da cabeça lembrando capacetes. A leitura arqueológica convencional as trata como representações de xamãs ou guerreiros; teóricos de "astronautas antigos" leem como registros de contato.',
   1, true),

  ('Antiguidade', 'A roda de Ezequiel', 'roda-de-ezequiel',
   '~593 a.C.', 'Babilônia (relato bíblico)',
   'No livro de Ezequiel, o profeta descreve uma visão de "rodas dentro de rodas", fogo, e quatro criaturas aladas descendo do céu. É um dos textos mais citados por leituras alternativas da Bíblia como registro de contato — embora a leitura teológica tradicional o trate como visão mística, não objeto físico.',
   2, true),

  ('Antiguidade', 'Vimanas nos textos védicos', 'vimanas-textos-vedicos',
   '~antiguidade, datação incerta', 'Índia (Ramayana e Mahabharata)',
   'Textos sagrados indianos descrevem "vimanas" — carros voadores usados por deuses e reis, capazes de viajar entre reinos e até guerrear no céu. Pesquisadores de "astronautas antigos" leem essas passagens como descrições de tecnologia avançada; indólogos as tratam como literatura mitológica e alegórica.',
   3, true),

  ('Antiguidade', 'Linhas de Nazca', 'linhas-de-nazca',
   '~500 a.C. – 500 d.C.', 'Deserto de Nazca, Peru',
   'Enormes geoglifos traçados no solo, visíveis por completo apenas do alto. A arqueologia os associa a rituais e observação astronômica da cultura Nazca; teorias de fronteira já propuseram que seriam marcações de pouso ou mensagens voltadas para observadores no céu.',
   4, true),

  ('Idade Média / Renascença', 'Fenômeno celestial de Nuremberg', 'fenomeno-nuremberg',
   '1561', 'Nuremberg, Sacro Império Romano-Germânico',
   'Um panfleto da época descreve e ilustra uma batalha de objetos no céu ao amanhecer — cilindros, esferas e cruzes envoltos em luz, seguidos por uma "grande vara preta". O relato é um dos registros mais antigos com ilustração detalhada de um fenômeno aéreo em massa.',
   5, true),

  ('Idade Média / Renascença', 'Esferas negras de Basileia', 'esferas-basileia',
   '1566', 'Basileia, Suíça',
   'Poucos anos depois de Nuremberg, testemunhas em Basileia relatam múltiplas esferas negras e vermelhas se movendo e "lutando" no céu antes de desaparecerem. Assim como Nuremberg, o relato foi documentado e ilustrado em panfletos da época.',
   6, true),

  ('Era moderna (pré-1947)', 'O milagre do sol em Fátima', 'milagre-do-sol-fatima',
   '1917', 'Fátima, Portugal',
   'Dezenas de milhares de pessoas reunidas em Fátima relatam ver o sol "dançar" no céu, mudar de cor e parecer se aproximar da terra. O episódio é tradicionalmente lido como milagre religioso; pesquisadores como Jacques Vallée o incluem entre os relatos que estudam sob a hipótese de que fenômenos aéreos não identificados acompanham a história humana muito antes da era dos "discos voadores".',
   7, true);
