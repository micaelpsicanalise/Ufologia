-- ===================================================================
-- ARQUIVO X-BR — Sipapuni e o Povo das Formigas (Hopi)
-- Rode isto no SQL Editor do Supabase (depois do seed-jinn.sql —
-- usa os mesmos slugs de reordenação).
-- ===================================================================

update ufologia.relatos_historicos set ordem = ordem + 1
  where slug in ('candelabro-de-paracas', 'linhas-de-nazca', 'fenomeno-nuremberg',
                  'esferas-basileia', 'milagre-do-sol-fatima', 'comando-ashtar');

insert into ufologia.relatos_historicos
  (era, titulo, slug, periodo, local, descricao, teoria_conspiracao, ordem, publicado)
values
  ('Pré-história / tradição oral viva', 'Sipapuni e o Povo das Formigas', 'sipapuni-povo-das-formigas',
   'Tradição oral hopi de origem incerta, documentada por etnógrafos a partir de 1870',
   'Grand Canyon e Little Colorado River Gorge, Arizona, EUA',
   'A cosmologia hopi descreve Quatro Mundos: cada um dos três primeiros foi destruído (por fogo, por gelo e por água, nas versões mais comuns), e os sobreviventes de cada cataclisma foram levados pra debaixo da terra por seres chamados, em hopi, Anu Sinom — o "Povo das Formigas" — que os abrigaram, alimentaram e ensinaram a cultivar comida sem luz solar até a superfície poder ser habitada de novo. A passagem entre o Terceiro e o atual Quarto Mundo tem endereço físico real: o Sipapuni, uma cúpula de travertino formada por uma nascente mineral no leito do Little Colorado River Gorge, dentro do Grand Canyon — os hopi ainda fazem uma peregrinação ritual até lá pela chamada "trilha do sal". Toda kiva (câmara cerimonial subterrânea hopi) reproduz essa arquitetura em miniatura: um pequeno buraco no chão, também chamado sipapu, representa a mesma passagem entre mundos. Evidência física real e independente da cosmologia foi encontrada em cavernas do Grand Canyon: mais de 100 figurinhas de gravetos trançados, algumas atravessadas por uma "lança" em miniatura, foram escavadas por Robert C. Euler a partir de 1954 em Stanton''s Cave — datadas por radiocarbono em cerca de 4.000 anos, indicando uso ritual contínuo dessas cavernas por povos arcaicos muito antes dos hopi históricos.',
   'Autores de "astronautas antigos" — sobretudo em sites como Ancient Origins e no canal de streaming Gaia — leem "Anu Sinom" como uma correspondência direta com os Anunnaki da mitologia suméria, propondo que "Anu" (formiga, em hopi) mais "naki" (amigos) formariam "Anu-naki", e que o deus celeste sumério Anu seria o mesmo nome por coincidência não-acidental. Linguisticamente isso éuma etimologia popular, não um achado reconhecido: hopi é uma língua uto-asteca, sem parentesco demonstrado com o sumério (língua isolada), e a semelhança sonora entre "Anunnaki" e "Anu-naki" é consistente com coincidência entre línguas não relacionadas. A mesma linha de teóricos compara a descrição física do Povo das Formigas (pele escura, membros longos e finos, comunicação sem fala) aos "cinzentos" da ufologia moderna — outra reinterpretação contemporânea sem base na tradição oral hopi original, que descreve os Anu Sinom como guardiões subterrâneos, não como visitantes de outro planeta.',
   6, true);
