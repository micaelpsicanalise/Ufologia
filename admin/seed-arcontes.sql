-- ===================================================================
-- ARQUIVO X-BR — Os Arcontes: gnosticismo e a "hipótese arcôntica"
-- Rode isto no SQL Editor do Supabase (depois do seed-historicos.sql
-- e do seed-conspiracao.sql, que já usam os slugs abaixo).
-- ===================================================================

-- abre espaço cronológico: o texto é do séc. II d.C., então entra
-- entre "Vimanas" (Antiguidade) e o Candelabro de Paracas / Nazca em diante
update ufologia.relatos_historicos set ordem = ordem + 1
  where slug in ('candelabro-de-paracas', 'linhas-de-nazca', 'fenomeno-nuremberg',
                  'esferas-basileia', 'milagre-do-sol-fatima', 'comando-ashtar');

insert into ufologia.relatos_historicos
  (era, titulo, slug, periodo, local, descricao, teoria_conspiracao, ordem, publicado)
values
  ('Antiguidade tardia', 'Os Arcontes: carcereiros cósmicos', 'arcontes-carcereiros-cosmicos',
   '~séc. II d.C. (atacado por Irineu em 180 d.C.); enterrado ~séc. IV, redescoberto em 1945',
   'Nag Hammadi, Egito',
   'O Apócrifo de João ("Livro Secreto de João") é um dos textos gnósticos mais importantes encontrados em Nag Hammadi, Egito, em 1945 — parte de 13 códices provavelmente enterrados pra escapar da ordem do bispo Atanásio de Alexandria, em 367 d.C., de que mosteiros egípcios se livrassem de "livros ilegítimos e secretos". O texto já era atacado por Irineu de Lyon por volta de 180 d.C., o que indica composição anterior a essa data. Descreve uma cosmologia elaborada: um deus menor e imperfeito chamado Yaldabaoth (o "demiurgo") cria o mundo material sem perceber que usa luz divina roubada, e povoa sua criação com arcontes — administradores subordinados que governam camadas da realidade e mantêm a humanidade "esquecida" de sua origem divina através do corpo material. É um documento histórico real, estudado seriamente pela academia como uma das principais fontes do pensamento gnóstico do século II.',
   'Autores contemporâneos de esoterismo — o mais citado é John Lamb Lash, com o livro "Not in His Image" (2006) — releem os arcontes não como metáfora religiosa antiga, mas como descrição literal de uma inteligência não-humana que ainda hoje controlaria a percepção da humanidade, ligando-os diretamente a relatos modernos de abdução alienígena, "cinzentos" e reptilianos: a ideia é que o mesmo fenômeno descrito há 1.800 anos seria hoje interpretado através do vocabulário da ufologia. Conteúdo popular recente vai além, apresentando o texto como um "contrato pré-nascimento" assinado antes de encarnar — uma leitura terapêutica moderna sem correspondência direta no texto original, que fala em esquecimento imposto, não em consentimento contratual. Também é comum o argumento de que o próprio enterro dos códices prova que a Igreja perseguiu o texto por ele ser uma "verdade ameaçadora" — raciocínio que ignora que instituições também suprimem ideias que consideram falsas ou desestabilizadoras, não só as que seriam verdadeiras.',
   4, true);
