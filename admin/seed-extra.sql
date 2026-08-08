-- ===================================================================
-- ARQUIVO X-BR — mais entidades + caso Varginha
-- Rode isto no SQL Editor do Supabase (depois do seed.sql original).
-- ===================================================================

insert into ufologia.entidades
  (nome, slug, apelido, caso_numero, descricao, primeiro_relato, comportamento, ocorrencia, nivel_ameaca, nivel_ameaca_label, ordem, publicado)
values
  ('Anfíbios', 'anfibios', '"Reptiloides aquáticos" · avistados perto d''água', '0512',
   'Relatados emergindo de lagos, rios e áreas costeiras, com pele escamosa ou úmida e membranas entre os dedos. Aparecem associados a teorias marginais sobre bases submersas.',
   'Anos 1960, avistamentos costeiros', 'Evasivo, ligado à água', 'rara', 2, 'baixo', 7, true),

  ('Híbridos', 'hibridos', '"Programa de hibridização" · geração posterior aos Cinzentos', '0674',
   'Descritos com traços mistos entre humanos e Cinzentos — pele mais clara, olhos menores, alguma expressão emocional. Aparecem principalmente em relatos de abdução recorrente, como se fizessem parte de um programa de gerações.',
   'Anos 1990, relatos de abdução recorrente', 'Curioso, próximo', 'baixa', 1, 'incerto', 8, true),

  ('Anciões', 'anciaos', '"Os Anciões" · figuras de contato cósmico', '0821',
   'Entidades altamente evoluídas, descritas em relatos de contato mais recentes como guias ou observadores antigos da humanidade. Comunicação quase sempre telepática, sem hostilidade relatada.',
   'Anos 1970, canalizações e contatismo', 'Instrutivo, distante', 'rara', 0, 'nenhum', 9, true),

  ('Homens Altos', 'homens-altos', '"Tall Whites" · associados a bases militares', '0399',
   'Humanoides muito altos (mais de 2 metros), pele clara, cabelos longos e brancos. Relatos concentrados nos EUA, frequentemente ligados a teorias de cooperação entre militares e visitantes.',
   'Anos 1950, relatos militares nos EUA', 'Distante, hierárquico', 'rara', 2, 'desconhecido', 10, true),

  ('Ser de Varginha', 'ser-de-varginha', '"ET de Varginha" · caso brasileiro emblemático', '0996',
   'Criatura pequena, marrom-avermelhada, com protuberâncias na cabeça e olhos vermelhos, relatada por testemunhas em Varginha (MG) em 1996. Um dos casos mais conhecidos da ufologia brasileira, com versões que vão do avistamento simples a teorias de encobrimento militar.',
   '1996, Varginha (MG), Brasil', 'Assustado, imóvel', 'baixa', 1, 'baixo, alto fator de repercussão', 11, true);

-- abre espaço na linha do tempo pro caso Varginha (1996) entre
-- Rendlesham (1980) e Phoenix (1997)
update ufologia.casos set ordem = ordem + 1 where ordem >= 4;

insert into ufologia.casos
  (ano, titulo, slug, descricao, ordem, publicado)
values
  ('1996', 'Caso Varginha', 'caso-varginha',
   'Moradores da cidade mineira relatam o avistamento de uma criatura não identificada, seguido por uma suposta operação militar de captura. Torna-se o caso ufológico mais famoso do Brasil, com desdobramentos ainda debatidos décadas depois.',
   4, true);
