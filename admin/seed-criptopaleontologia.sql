-- ===================================================================
-- ARQUIVO X-BR — seed de criptopaleontologia (Tier 1)
-- Rode isto DEPOIS de schema-criptopaleontologia.sql.
-- ===================================================================

insert into ufologia.criptopaleontologia
  (titulo, slug, categoria, periodo, descricao, teoria_conspiracao, ordem, publicado)
values

('Terra Oca', 'terra-oca', 'Ciência real distorcida', '1692 → hoje',
 'Em 1692, o astrônomo Edmond Halley — o do cometa — propôs a sério que a Terra teria cascas internas concêntricas, cada uma com campo magnético próprio, pra explicar o comportamento estranho da bússola. Sem sismologia, era hipótese científica legítima pra época. A ideia nunca morreu: virou movimento político no século XIX (um promotor quase convenceu o governo americano a financiar uma expedição aos polos), depois ocultismo, e por fim a mitologia de bases nazistas escondidas na Antártida.',
 null, 1, true),

('"Grande demais pra andar"', 'grande-demais-pra-andar', 'Ciência real distorcida', '2012',
 'Em 2012, o pesquisador britânico Brian Ford publicou um livro inteiro argumentando que nenhum dinossauro grande conseguiria sustentar o próprio peso em terra firme — todos teriam vivido n''água, usando a flutuação como suporte. A teoria ignora milhares de pegadas fossilizadas de dinossauros andando em terra seca e a estrutura óssea de sauropodes, construída como colunas de sustentação. Mesmo assim, ganhou cobertura da BBC como "correção revolucionária" à paleontologia.',
 null, 2, true),

('A Regra de Cope', 'regra-de-cope', 'Ciência real distorcida', 'Séc. XIX (observação) → hoje (uso indevido)',
 'A observação de que linhagens animais tendem a aumentar de porte ao longo do tempo — cavalos e baleias primitivas eram bem menores que seus descendentes — é uma tendência estatística real, batizada em homenagem ao paleontólogo Edward Drinker Cope, mas cheia de exceções, não uma lei biológica. Ainda assim, é usada por teóricos de fronteira como prova de que a evolução "quer" produzir organismos cada vez maiores e mais poderosos, com o ser humano na ponta — a mesma ideia da "escada evolutiva" com roupagem nova.',
 null, 3, true),

('Nêmesis, a estrela escondida', 'nemesis-estrela-escondida', 'Ciência real distorcida', 'Proposta nos anos 1980',
 'Cientistas notaram que grandes extinções pareciam seguir um ciclo de ~26 milhões de anos, e propuseram uma estrela companheira invisível do Sol — batizada Nêmesis — que perturbaria periodicamente a Nuvem de Oort, jogando cometas em direção à Terra. Buscas foram feitas, nada foi encontrado, e análises mais recentes sugerem que o próprio ciclo pode ser ruído estatístico. A hipótese foi abandonada pela ciência.',
 'A ideia de uma "estrela da morte" que o próprio establishment científico procurou e não encontrou virou modelo pronto pra qualquer teoria posterior sobre planetas ou objetos escondidos que "a ciência sabe que existem, mas não admite publicamente". Não há evidência de que qualquer busca real tenha sido interrompida ou escondida — a Nêmesis simplesmente não apareceu nos dados.',
 4, true),

('Dragões e a geomitologia', 'dragoes-geomitologia', 'Geomitologia', 'Documentado desde a Antiguidade',
 'A pesquisadora Adrienne Mayor, de Stanford, documentou décadas de casos em que povos antigos encontraram fósseis reais e construíram mitologia em cima deles — crânios de mastodonte interpretados como gigantes, crânios de elefante-anão como ciclopes. Um campo de estudo real, chamado geomitologia. Criacionistas leem essa pesquisa e a invertem: se toda cultura tem lenda de dragão, isso "provaria" convivência humana com dinossauros vivos — não que encontraram os ossos deles muito depois de extintos.',
 null, 5, true),

('As Pedras de Ica', 'pedras-de-ica', 'Fraude documentada', 'Coletadas a partir dos anos 1960',
 'O médico peruano Javier Cabrera reuniu mais de 11 mil pedras entalhadas com humanos convivendo, montando e até operando dinossauros, tratando-as como prova de civilização perdida. O homem que esculpiu a maior parte delas, Basilio Uschuya, confessou publicamente: usava broca odontológica e envelhecia as pedras em esterco. Cabrera preferiu acreditar que a confissão era mentira pra escapar de processo por falsificação. As pedras seguem citadas em literatura criacionista.',
 null, 6, true),

('As pegadas de Paluxy', 'pegadas-de-paluxy', 'Fraude documentada', 'Esculpidas nos anos 1930; promovidas nos anos 1970',
 'O leito do rio Paluxy, no Texas, tem pegadas reais e bem preservadas de dinossauros do Cretáceo. Durante a Depressão, moradores locais esculpiram pegadas humanas ao lado das verdadeiras pra vender aos turistas. Nos anos 1970, organizações criacionistas adotaram o local como prova de convivência entre humanos e dinossauros — um museu foi construído e segue aberto, mesmo boa parte dessas organizações tendo recuado publicamente da alegação nos anos 1980.',
 null, 7, true),

('O Homem de Piltdown', 'homem-de-piltdown', 'Fraude documentada', '1912–1953',
 'Em 1912, um crânio encontrado na Inglaterra — caixa craniana humana, mandíbula de aparência símia — foi aclamado como o "elo perdido" entre humanos e primatas, e ficou em livros didáticos e museus por quarenta anos. Quando um achado genuíno de ancestral humano surgiu na África em 1924, a comunidade científica o descartou em boa parte por não se parecer com Piltdown. Só em 1953 testes revelaram a fraude: crânio medieval, mandíbula de orangotango, dentes limados e tingidos quimicamente.',
 null, 8, true),

('A fraude paleolítica japonesa', 'fraude-paleolitica-japonesa', 'Fraude documentada', '1980–2000',
 'Por vinte anos, o arqueólogo Shinichi Fujimura foi apelidado de "as mãos de Deus" no Japão, por uma capacidade quase sobrenatural de encontrar artefatos antiguíssimos, recuando a pré-história japonesa em centenas de milhares de anos. Em 2000, jornalistas o filmaram escondidos: ele chegava antes do amanhecer e enterrava as próprias peças, que "descobriria" horas depois diante dos colegas. Mais de 180 sítios foram comprometidos.',
 null, 9, true),

('Os embriões de Haeckel', 'embrioes-de-haeckel', 'Fraude documentada', 'Publicado em 1874; usado até os anos 1990',
 'O biólogo alemão Ernst Haeckel publicou ilustrações comparando embriões de diferentes espécies lado a lado, pra sustentar a ideia de que o desenvolvimento embrionário "replaya" a evolução da espécie. As imagens eram persuasivas — e manipuladas: Haeckel suavizou diferenças reais entre espécies pra reforçar a semelhança que queria mostrar. Confrontado, admitiu ter "limpado" os desenhos. Versões dessas ilustrações continuaram em livros didáticos de biologia até os anos 1990.',
 null, 10, true),

('Criacionismo da Terra Jovem', 'criacionismo-terra-jovem', 'Movimento organizado', 'Movimento moderno, base do séc. XIX',
 'Entre 40% e 50% dos adultos americanos aceitam alguma versão da ideia de que a Terra tem menos de 10 mil anos e que humanos e dinossauros conviveram. É um movimento com museus (como o Creation Museum, no Kentucky, que exibe Adão e Eva ao lado de um T-Rex), currículos próprios e infraestrutura política. A explicação interna: dinossauros teriam ido na Arca de Noé como filhotes, e sido extintos séculos depois pelo clima pós-dilúvio.',
 null, 11, true),

('Baraminologia', 'baraminologia', 'Movimento organizado', 'Desenvolvida a partir dos anos 1990',
 'A tentativa criacionista de construir uma taxonomia biológica paralela: espécies pertenceriam a "tipos criados" (baramin) fixos, que podem variar internamente mas nunca compartilhar ancestralidade entre tipos diferentes. O sistema tem aparência acadêmica — matemática própria, publicações, conferências — mas as fronteiras entre "tipos" desmoronam ao serem examinadas de perto.',
 null, 12, true),

('A hipótese Omphalos', 'hipotese-omphalos', 'Movimento organizado', '1857',
 'Proposta pelo naturalista Philip Gosse, é talvez a ideia mais bem construída pra ser irrefutável: Deus teria criado o mundo já com "aparência de idade" — árvores no Éden com anéis de crescimento nunca vividos, rochas já com fósseis de organismos que nunca existiram de fato. Qualquer evidência contrária vira, por definição, mais uma peça do cenário criado. Não existe teste que possa contradizer a hipótese.',
 null, 13, true),

('A conspiração do Smithsonian', 'conspiracao-smithsonian', 'Conspiração', 'Narrativa consolidada a partir de 2014',
 'A alegação de que o museu esconde esqueletos de gigantes humanos — os Nefilins bíblicos — pra não confirmar publicamente que o Gênesis é literalmente verdadeiro.',
 'A versão mais citada hoje nasceu, ironicamente, de um artigo de humor de 2014 que muita gente levou a sério — mas jornais sensacionalistas já publicavam histórias de "ossos de gigante" desde o século XIX, boa parte delas ossadas de mamute ou mastodonte mal identificadas. Não há evidência de cofres secretos ou campanha de supressão, e os limites físicos do esqueleto humano tornam gigantes de 3,5 metros anatomicamente inviáveis — mas a alegação de encobrimento é repetida como fato consumado em círculos que já desconfiam de instituições por outros motivos.',
 14, true),

('Arqueologia proibida', 'arqueologia-proibida', 'Conspiração', 'Livro publicado em 1993, ainda em circulação',
 'A obra central é um livro de 900 páginas do autor Michael Cremo, defendendo que humanos modernos existem há centenas de milhões de anos.',
 'Cremo argumenta que a ciência mainstream vem suprimindo sistematicamente as evidências desde a era vitoriana, através do que ele chama de "filtro de conhecimento" — qualquer achado incompatível com a linha do tempo aceita seria descartado ou esquecido de propósito. Boa parte dos relatos que ele cita vêm de escavações amadoras do século XIX, sem documentação confiável o bastante pra sustentar qualquer conclusão — não descartadas por conspiração, mas por metodologia insuficiente. Cremo é ligado ao movimento Hare Krishna, e sua cronologia bate exatamente com a cosmologia religiosa do grupo, algo que raramente menciona em suas apresentações públicas.',
 15, true),

('"Microchips" em fósseis', 'microchips-em-fosseis', 'Conspiração', 'Alegações recorrentes desde os anos 2000',
 'De tempos em tempos, alguém divulga uma rocha com padrões geométricos regulares como prova de tecnologia avançada pré-histórica — de componentes de computador a dispositivos de rastreamento implantados por civilizações perdidas.',
 'Quase sempre, o que se encontrou foi um fóssil de crinoide — animal marinho com corpo feito de placas empilhadas que, ao se fraturar, produz seções transversais estranhamente geométricas, do mesmo jeito que flocos de neve ou favos de mel são geométricos sem qualquer projeto por trás. Mostrar a explicação raramente encerra a alegação: quando confrontados com o fóssil real, defensores da teoria costumam recuar pra "talvez esse exemplar seja natural, mas os outros foram fabricados pela mesma civilização".',
 16, true),

('Lemúria', 'lemuria', 'Conspiração', 'Hipótese de 1860; virou mito nos anos 1900',
 'Em 1860, um zoólogo notou que fósseis de lêmures apareciam em Madagascar e na Índia, mas não nas terras entre os dois, e propôs um continente afundado conectando as duas regiões — hipótese plausível antes de existir a teoria da tectônica de placas.',
 'Ocultistas do início do século XX transformaram a hipótese zoológica numa civilização perdida povoada por seres gigantes, incorporando-a à mitologia da Atlântida. Hoje sabemos que a resposta real é bem mais simples — Madagascar e Índia estavam fisicamente unidas no supercontinente Gonduana antes de se separarem —, mas o mito da civilização perdida sobreviveu à explicação que o tornou desnecessário, e quem tenta corrigir com tectônica de placas costuma ser tratado, nesses círculos, como parte do encobrimento.',
 17, true),

('O Dinossauroide', 'dinossauroide', 'Ciência real mal-entendida', '1982',
 'Em 1982, o paleontólogo Dale Russell propôs um exercício de pensamento: como seria um dinossauro pequeno e relativamente encefalizado se tivesse evoluído inteligência ao nível humano, ao longo de mais 65 milhões de anos? O resultado que ele desenhou — pele glabra, olhos grandes, postura ereta, três dedos — lembra de forma inquietante um "cinzento" clássico da ufologia. Russell insistiu, pelo resto da carreira, que era só um exercício hipotético sobre se inteligência exige corpo humanoide.',
 'A imagem circula hoje em teorias que tratam alienígenas não como visitantes de outro planeta, mas como dinossauros terrestres evoluídos que sobreviveram à extinção e vêm nos observando (ou controlando) desde então — conectando essa teoria diretamente ao catálogo de entidades e à hipótese interdimensional discutidos em outras seções deste arquivo.',
 18, true)

on conflict (slug) do update set
  descricao = excluded.descricao,
  teoria_conspiracao = excluded.teoria_conspiracao;
