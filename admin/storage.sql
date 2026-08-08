-- ===================================================================
-- ARQUIVO X-BR — bucket de imagens (Supabase Storage)
-- Rode isto no SQL Editor do Supabase.
-- ===================================================================

-- cria o bucket público "imagens" (se ainda não existir)
insert into storage.buckets (id, name, public)
values ('imagens', 'imagens', true)
on conflict (id) do nothing;

-- qualquer pessoa pode VER as imagens (o bucket é público)
create policy "Leitura pública do bucket imagens"
on storage.objects for select
using (bucket_id = 'imagens');

-- só quem está logado no admin pode enviar
create policy "Upload autenticado no bucket imagens"
on storage.objects for insert
to authenticated
with check (bucket_id = 'imagens');

-- só quem está logado no admin pode substituir
create policy "Update autenticado no bucket imagens"
on storage.objects for update
to authenticated
using (bucket_id = 'imagens');

-- só quem está logado no admin pode excluir
create policy "Delete autenticado no bucket imagens"
on storage.objects for delete
to authenticated
using (bucket_id = 'imagens');
