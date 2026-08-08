-- ===================================================================
-- ARQUIVO X-BR — seed da camada de conspiração
-- Rode isto DEPOIS de migrate-conspiracao.sql.
-- ===================================================================

-- novo relato histórico: Candelabro de Paracas
insert into ufologia.relatos_historicos
  (era, titulo, slug, periodo, local, descricao, teoria_conspiracao, ordem, publicado)
values
  ('Antiguidade', 'Candelabro de Paracas', 'candelabro-de-paracas',
   '~200 a.C. (datação arqueológica)', 'Península de Paracas, Peru',
   'Um geoglifo de 180 metros entalhado na encosta do deserto, visível a 19 km de distância no mar. A leitura convencional o atribui à cultura Paracas, com base em cerâmica datada por radiocarbono, provavelmente como marco cerimonial ou ponto de referência de navegação — sua função exata segue incerta mesmo na arqueologia oficial.',
   'Uma leitura de fronteira aponta uma passagem do Ramayana em que o rei Sugriva envia os vanaras para os quatro cantos do mundo, e um deles avista "um pico de rocha onde brilha um pilar dourado de três pontas" — descrição que, segundo essa teoria, bateria com o Candelabro visto do mar. Defensores da ideia argumentam que a arqueologia oficial ignora esse tipo de cruzamento entre texto antigo e sítio real por não caber na cronologia aceita de contato entre civilizações distantes — não por falta de mérito na comparação.',
   4, true)
on conflict (slug) do update set
  descricao = excluded.descricao,
  teoria_conspiracao = excluded.teoria_conspiracao;

-- reordena o que vem depois do Candelabro na camada histórica
update ufologia.relatos_historicos set ordem = ordem + 1
  where slug in ('linhas-de-nazca', 'fenomeno-nuremberg', 'esferas-basileia', 'milagre-do-sol-fatima');

-- teorias de conspiração dos casos modernos que já têm uma documentada
update ufologia.casos set teoria_conspiracao =
  'O relato oficial mudou de "disco voador" pra "balão meteorológico" em menos de 24 horas. Décadas depois, documentos e depoimentos alimentaram a teoria de que destroços e corpos não-humanos teriam sido levados à Base Aérea Wright-Patterson, dando origem ao suposto grupo secreto "Majestic 12", encarregado de estudar o material e encobrir sua origem.'
  where slug = 'incidente-de-roswell';

update ufologia.casos set teoria_conspiracao =
  'Segundo essa linha, o Exército teria retirado ao menos um ser — vivo ou ferido — do local, levado sob escolta a hospitais e instalações militares em Varginha. Familiares de militares e funcionários de hospital relataram anos depois pressão para não comentar o caso, alimentando a teoria de uma operação conjunta de contenção envolvendo autoridades locais e federais.'
  where slug = 'caso-varginha';

update ufologia.casos set teoria_conspiracao =
  'A Força Aérea dos EUA atribuiu as luzes a bengalas de iluminação (flares) lançadas em um exercício militar próximo. O então governador do Arizona, Fife Symington — que zombou publicamente do caso na época — admitiu anos depois ter visto pessoalmente um objeto que não conseguia explicar, alimentando a suspeita de que a explicação oficial serviu para encerrar o assunto rápido demais.'
  where slug = 'luzes-de-phoenix';

update ufologia.casos set teoria_conspiracao =
  'O caso ocorreu perto de uma base usada para armazenar armas nucleares da OTAN, o que levou teóricos a suspeitar de relação com testes militares sigilosos em vez de (ou além de) um encontro genuíno. O memorando escrito na época pelo vice-comandante da base, Charles Halt, só foi desclassificado anos depois — alimentando a leitura de que o Ministério da Defesa britânico e a força aérea americana sabiam mais do que admitiram publicamente.'
  where slug = 'floresta-de-rendlesham';

update ufologia.casos set teoria_conspiracao =
  'Em 2023, o ex-oficial de inteligência David Grusch testemunhou sob juramento no Congresso dos EUA que o governo mantém, há décadas, um programa secreto de recuperação e engenharia reversa de naves "não-humanas", incluindo "biológicos" recuperados de destroços. O Pentágono negou publicamente as alegações. Grusch não apresentou evidência física em sua testemunha, então isso permanece como afirmação não confirmada — mas alimentou a suspeita de que o relatório de 2021 foi deliberadamente incompleto.'
  where slug = 'relatorio-pentagono-uaps';
