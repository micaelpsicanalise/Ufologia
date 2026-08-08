// ===================================================================
// ARQUIVO X-BR — admin.js
// Login (Supabase Auth) + CRUD de entidades/casos.
// Schema Postgres: ufologia (não public).
//
// IMPORTANTE: preencher as mesmas credenciais usadas no site público
// (se o site também ler do Supabase). Este arquivo é independente,
// então as constantes abaixo precisam ser mantidas em sincronia
// manualmente se você tiver mais de um lugar usando o mesmo projeto.
// ===================================================================

const SUPABASE_URL = 'https://aewcxqzpbipwcdpsjfht.supabase.co';
const SUPABASE_ANON_KEY = 'sb_publishable_mINpOQLVbi0pilHc9bEtBA_l1a0o6c6';

const sb = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY, {
  db: { schema: 'ufologia' }
});

// ---------- Elementos ----------
const loginScreen = document.getElementById('loginScreen');
const adminShell = document.getElementById('adminShell');
const loginForm = document.getElementById('loginForm');
const loginError = document.getElementById('loginError');
const logoutBtn = document.getElementById('logoutBtn');

// ---------- Sessão ----------
async function checkSession() {
  const { data: { session } } = await sb.auth.getSession();
  if (session) {
    showShell();
  } else {
    showLogin();
  }
}

function showLogin() {
  loginScreen.hidden = false;
  adminShell.hidden = true;
}

function showShell() {
  loginScreen.hidden = true;
  adminShell.hidden = false;
  loadEntidades();
  loadCasos();
  loadHistoricos();
}

loginForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  loginError.classList.remove('show');
  const email = document.getElementById('loginEmail').value.trim();
  const password = document.getElementById('loginPassword').value;

  const { error } = await sb.auth.signInWithPassword({ email, password });
  if (error) {
    loginError.classList.add('show');
    return;
  }
  showShell();
});

// reforço: garante que Enter nos campos de login sempre dispara o submit,
// mesmo se o navegador (autofill, extensões etc.) interceptar o Enter nativo.
['loginEmail', 'loginPassword'].forEach(id => {
  document.getElementById(id).addEventListener('keydown', (e) => {
    if (e.key === 'Enter') {
      e.preventDefault();
      loginForm.requestSubmit();
    }
  });
});

logoutBtn.addEventListener('click', async () => {
  await sb.auth.signOut();
  showLogin();
});

// ---------- Navegação entre views ----------
const navButtons = document.querySelectorAll('.admin-nav button');
navButtons.forEach(btn => {
  btn.addEventListener('click', () => {
    navButtons.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');
    ['entidades', 'casos', 'historicos'].forEach(v => {
      document.getElementById(`view-${v}`).hidden = (v !== btn.dataset.view);
    });
  });
});

// ===================================================================
// ENTIDADES
// ===================================================================

const entidadeModal = document.getElementById('entidadeModal');
const entidadeForm = document.getElementById('entidadeForm');
const entidadeError = document.getElementById('entidadeError');

const OCORRENCIA_LABEL = {
  muito_alta: 'Muito alta',
  alta: 'Alta',
  moderada: 'Moderada',
  baixa: 'Baixa',
  rara: 'Rara'
};

function threatBars(nivel) {
  const n = Math.max(0, Math.min(5, parseInt(nivel, 10) || 0));
  let html = '<div class="threat-cell">';
  for (let i = 0; i < 5; i++) {
    html += `<i class="${i < n ? 'on' : ''}"></i>`;
  }
  return html + '</div>';
}

async function loadEntidades() {
  const tbody = document.getElementById('entidadesTbody');
  const { data, error } = await sb.from('entidades').select('*').order('ordem', { ascending: true });

  if (error) {
    tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Erro ao carregar: ${error.message}</td></tr>`;
    return;
  }
  if (!data || data.length === 0) {
    tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Nenhuma entidade cadastrada ainda.</td></tr>`;
    return;
  }

  tbody.innerHTML = data.map(e => `
    <tr>
      <td><strong>${escapeHtml(e.nome)}</strong></td>
      <td>${escapeHtml(e.caso_numero || '—')}</td>
      <td>${threatBars(e.nivel_ameaca)}</td>
      <td><span class="badge ${e.publicado ? 'badge-on' : 'badge-off'}">${e.publicado ? 'Publicado' : 'Rascunho'}</span></td>
      <td>${e.ordem ?? 0}</td>
      <td>
        <div class="row-actions">
          <button data-id="${e.id}" class="editEntidade">Editar</button>
          <button data-id="${e.id}" class="danger deleteEntidade">Excluir</button>
        </div>
      </td>
    </tr>
  `).join('');

  tbody.querySelectorAll('.editEntidade').forEach(b => b.addEventListener('click', () => editEntidade(b.dataset.id, data)));
  tbody.querySelectorAll('.deleteEntidade').forEach(b => b.addEventListener('click', () => deleteEntidade(b.dataset.id)));
}

function openEntidadeModal(title) {
  document.getElementById('entidadeModalTitle').textContent = title;
  entidadeError.classList.remove('show');
  entidadeModal.hidden = false;
}

function renderImagemPreview(url) {
  const box = document.getElementById('entidadeImagemPreview');
  box.innerHTML = url ? `<img src="${url}" alt="Prévia da imagem">` : '';
}

// upload pro bucket "imagens" assim que o arquivo é escolhido
document.getElementById('entidadeImagemFile').addEventListener('change', async (ev) => {
  const file = ev.target.files[0];
  const status = document.getElementById('entidadeImagemStatus');
  if (!file) return;

  status.textContent = 'Enviando...';
  status.classList.remove('error');

  const ext = file.name.split('.').pop();
  const path = `entidades/${Date.now()}-${Math.random().toString(36).slice(2, 8)}.${ext}`;

  const { error: uploadError } = await sb.storage.from('imagens').upload(path, file, {
    cacheControl: '3600',
    upsert: false
  });

  if (uploadError) {
    status.textContent = 'Erro no upload: ' + uploadError.message;
    status.classList.add('error');
    return;
  }

  const { data: urlData } = sb.storage.from('imagens').getPublicUrl(path);
  document.getElementById('entidadeImagem').value = urlData.publicUrl;
  renderImagemPreview(urlData.publicUrl);
  status.textContent = 'Upload concluído.';
});

document.getElementById('newEntidadeBtn').addEventListener('click', () => {
  entidadeForm.reset();
  document.getElementById('entidadeId').value = '';
  document.getElementById('entidadeOcorrencia').value = 'moderada';
  document.getElementById('entidadeImagemStatus').textContent = '';
  renderImagemPreview('');
  openEntidadeModal('Nova entidade');
});

document.getElementById('entidadeCancelBtn').addEventListener('click', () => entidadeModal.hidden = true);
enableEnterToSubmit(entidadeForm);

// se alguém colar um link direto na URL, atualiza a prévia também
document.getElementById('entidadeImagem').addEventListener('change', (ev) => {
  renderImagemPreview(ev.target.value.trim());
});

function editEntidade(id, data) {
  const e = data.find(x => x.id === id);
  if (!e) return;
  document.getElementById('entidadeId').value = e.id;
  document.getElementById('entidadeNome').value = e.nome || '';
  document.getElementById('entidadeSlug').value = e.slug || '';
  document.getElementById('entidadeApelido').value = e.apelido || '';
  document.getElementById('entidadeCasoNumero').value = e.caso_numero || '';
  document.getElementById('entidadeDescricao').value = e.descricao || '';
  document.getElementById('entidadePrimeiroRelato').value = e.primeiro_relato || '';
  document.getElementById('entidadeComportamento').value = e.comportamento || '';
  document.getElementById('entidadeOcorrencia').value = e.ocorrencia || 'moderada';
  document.getElementById('entidadeAmeaca').value = e.nivel_ameaca ?? 0;
  document.getElementById('entidadeAmeacaLabel').value = e.nivel_ameaca_label || '';
  document.getElementById('entidadeImagem').value = e.imagem_url || '';
  document.getElementById('entidadeImagemStatus').textContent = '';
  renderImagemPreview(e.imagem_url || '');
  document.getElementById('entidadeOrdem').value = e.ordem ?? 0;
  document.getElementById('entidadePublicado').checked = !!e.publicado;
  openEntidadeModal('Editar entidade');
}

async function deleteEntidade(id) {
  if (!confirm('Excluir esta entidade? Essa ação não pode ser desfeita.')) return;
  const { error } = await sb.from('entidades').delete().eq('id', id);
  if (error) { alert('Erro ao excluir: ' + error.message); return; }
  loadEntidades();
}

entidadeForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  entidadeError.classList.remove('show');

  const id = document.getElementById('entidadeId').value;
  const payload = {
    nome: document.getElementById('entidadeNome').value.trim(),
    slug: document.getElementById('entidadeSlug').value.trim(),
    apelido: document.getElementById('entidadeApelido').value.trim() || null,
    caso_numero: document.getElementById('entidadeCasoNumero').value.trim() || null,
    descricao: document.getElementById('entidadeDescricao').value.trim() || null,
    primeiro_relato: document.getElementById('entidadePrimeiroRelato').value.trim() || null,
    comportamento: document.getElementById('entidadeComportamento').value.trim() || null,
    ocorrencia: document.getElementById('entidadeOcorrencia').value,
    nivel_ameaca: parseInt(document.getElementById('entidadeAmeaca').value, 10) || 0,
    nivel_ameaca_label: document.getElementById('entidadeAmeacaLabel').value.trim() || null,
    imagem_url: document.getElementById('entidadeImagem').value.trim() || null,
    ordem: parseInt(document.getElementById('entidadeOrdem').value, 10) || 0,
    publicado: document.getElementById('entidadePublicado').checked,
    atualizado_em: new Date().toISOString()
  };

  const query = id
    ? sb.from('entidades').update(payload).eq('id', id)
    : sb.from('entidades').insert(payload);

  const { error } = await query;
  if (error) {
    entidadeError.textContent = 'Erro ao salvar: ' + error.message;
    entidadeError.classList.add('show');
    return;
  }
  entidadeModal.hidden = true;
  loadEntidades();
});

// ===================================================================
// CASOS (linha do tempo)
// ===================================================================

const casoModal = document.getElementById('casoModal');
const casoForm = document.getElementById('casoForm');
const casoError = document.getElementById('casoError');

async function loadCasos() {
  const tbody = document.getElementById('casosTbody');
  const { data, error } = await sb.from('casos').select('*').order('ordem', { ascending: true });

  if (error) {
    tbody.innerHTML = `<tr><td colspan="5" class="empty-state">Erro ao carregar: ${error.message}</td></tr>`;
    return;
  }
  if (!data || data.length === 0) {
    tbody.innerHTML = `<tr><td colspan="5" class="empty-state">Nenhum caso cadastrado ainda.</td></tr>`;
    return;
  }

  tbody.innerHTML = data.map(c => `
    <tr>
      <td><strong>${escapeHtml(c.ano)}</strong></td>
      <td>${escapeHtml(c.titulo)}</td>
      <td><span class="badge ${c.publicado ? 'badge-on' : 'badge-off'}">${c.publicado ? 'Publicado' : 'Rascunho'}</span></td>
      <td>${c.ordem ?? 0}</td>
      <td>
        <div class="row-actions">
          <button data-id="${c.id}" class="editCaso">Editar</button>
          <button data-id="${c.id}" class="danger deleteCaso">Excluir</button>
        </div>
      </td>
    </tr>
  `).join('');

  tbody.querySelectorAll('.editCaso').forEach(b => b.addEventListener('click', () => editCaso(b.dataset.id, data)));
  tbody.querySelectorAll('.deleteCaso').forEach(b => b.addEventListener('click', () => deleteCaso(b.dataset.id)));
}

function openCasoModal(title) {
  document.getElementById('casoModalTitle').textContent = title;
  casoError.classList.remove('show');
  casoModal.hidden = false;
}

document.getElementById('newCasoBtn').addEventListener('click', () => {
  casoForm.reset();
  document.getElementById('casoId').value = '';
  document.getElementById('casoPublicado').checked = true;
  openCasoModal('Novo caso');
});

document.getElementById('casoCancelBtn').addEventListener('click', () => casoModal.hidden = true);
enableEnterToSubmit(casoForm);

function editCaso(id, data) {
  const c = data.find(x => x.id === id);
  if (!c) return;
  document.getElementById('casoId').value = c.id;
  document.getElementById('casoAno').value = c.ano || '';
  document.getElementById('casoTitulo').value = c.titulo || '';
  document.getElementById('casoSlug').value = c.slug || '';
  document.getElementById('casoDescricao').value = c.descricao || '';
  document.getElementById('casoOrdem').value = c.ordem ?? 0;
  document.getElementById('casoPublicado').checked = !!c.publicado;
  openCasoModal('Editar caso');
}

async function deleteCaso(id) {
  if (!confirm('Excluir este caso? Essa ação não pode ser desfeita.')) return;
  const { error } = await sb.from('casos').delete().eq('id', id);
  if (error) { alert('Erro ao excluir: ' + error.message); return; }
  loadCasos();
}

casoForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  casoError.classList.remove('show');

  const id = document.getElementById('casoId').value;
  const payload = {
    ano: document.getElementById('casoAno').value.trim(),
    titulo: document.getElementById('casoTitulo').value.trim(),
    slug: document.getElementById('casoSlug').value.trim(),
    descricao: document.getElementById('casoDescricao').value.trim() || null,
    ordem: parseInt(document.getElementById('casoOrdem').value, 10) || 0,
    publicado: document.getElementById('casoPublicado').checked,
    atualizado_em: new Date().toISOString()
  };

  const query = id
    ? sb.from('casos').update(payload).eq('id', id)
    : sb.from('casos').insert(payload);

  const { error } = await query;
  if (error) {
    casoError.textContent = 'Erro ao salvar: ' + error.message;
    casoError.classList.add('show');
    return;
  }
  casoModal.hidden = true;
  loadCasos();
});

// ===================================================================
// RELATOS HISTÓRICOS
// ===================================================================

const historicoModal = document.getElementById('historicoModal');
const historicoForm = document.getElementById('historicoForm');
const historicoError = document.getElementById('historicoError');

async function loadHistoricos() {
  const tbody = document.getElementById('historicosTbody');
  const { data, error } = await sb.from('relatos_historicos').select('*').order('ordem', { ascending: true });

  if (error) {
    tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Erro ao carregar: ${error.message}</td></tr>`;
    return;
  }
  if (!data || data.length === 0) {
    tbody.innerHTML = `<tr><td colspan="6" class="empty-state">Nenhum relato cadastrado ainda.</td></tr>`;
    return;
  }

  tbody.innerHTML = data.map(h => `
    <tr>
      <td><strong>${escapeHtml(h.periodo || '—')}</strong></td>
      <td>${escapeHtml(h.titulo)}</td>
      <td>${escapeHtml(h.era)}</td>
      <td><span class="badge ${h.publicado ? 'badge-on' : 'badge-off'}">${h.publicado ? 'Publicado' : 'Rascunho'}</span></td>
      <td>${h.ordem ?? 0}</td>
      <td>
        <div class="row-actions">
          <button data-id="${h.id}" class="editHistorico">Editar</button>
          <button data-id="${h.id}" class="danger deleteHistorico">Excluir</button>
        </div>
      </td>
    </tr>
  `).join('');

  tbody.querySelectorAll('.editHistorico').forEach(b => b.addEventListener('click', () => editHistorico(b.dataset.id, data)));
  tbody.querySelectorAll('.deleteHistorico').forEach(b => b.addEventListener('click', () => deleteHistorico(b.dataset.id)));
}

function openHistoricoModal(title) {
  document.getElementById('historicoModalTitle').textContent = title;
  historicoError.classList.remove('show');
  historicoModal.hidden = false;
}

document.getElementById('newHistoricoBtn').addEventListener('click', () => {
  historicoForm.reset();
  document.getElementById('historicoId').value = '';
  openHistoricoModal('Novo relato');
});

document.getElementById('historicoCancelBtn').addEventListener('click', () => historicoModal.hidden = true);
enableEnterToSubmit(historicoForm);

function editHistorico(id, data) {
  const h = data.find(x => x.id === id);
  if (!h) return;
  document.getElementById('historicoId').value = h.id;
  document.getElementById('historicoEra').value = h.era || '';
  document.getElementById('historicoTitulo').value = h.titulo || '';
  document.getElementById('historicoSlug').value = h.slug || '';
  document.getElementById('historicoPeriodo').value = h.periodo || '';
  document.getElementById('historicoLocal').value = h.local || '';
  document.getElementById('historicoDescricao').value = h.descricao || '';
  document.getElementById('historicoOrdem').value = h.ordem ?? 0;
  document.getElementById('historicoPublicado').checked = !!h.publicado;
  openHistoricoModal('Editar relato');
}

async function deleteHistorico(id) {
  if (!confirm('Excluir este relato? Essa ação não pode ser desfeita.')) return;
  const { error } = await sb.from('relatos_historicos').delete().eq('id', id);
  if (error) { alert('Erro ao excluir: ' + error.message); return; }
  loadHistoricos();
}

historicoForm.addEventListener('submit', async (e) => {
  e.preventDefault();
  historicoError.classList.remove('show');

  const id = document.getElementById('historicoId').value;
  const payload = {
    era: document.getElementById('historicoEra').value.trim(),
    titulo: document.getElementById('historicoTitulo').value.trim(),
    slug: document.getElementById('historicoSlug').value.trim(),
    periodo: document.getElementById('historicoPeriodo').value.trim() || null,
    local: document.getElementById('historicoLocal').value.trim() || null,
    descricao: document.getElementById('historicoDescricao').value.trim() || null,
    ordem: parseInt(document.getElementById('historicoOrdem').value, 10) || 0,
    publicado: document.getElementById('historicoPublicado').checked,
    atualizado_em: new Date().toISOString()
  };

  const query = id
    ? sb.from('relatos_historicos').update(payload).eq('id', id)
    : sb.from('relatos_historicos').insert(payload);

  const { error } = await query;
  if (error) {
    historicoError.textContent = 'Erro ao salvar: ' + error.message;
    historicoError.classList.add('show');
    return;
  }
  historicoModal.hidden = true;
  loadHistoricos();
});

// ---------- Util ----------
function escapeHtml(str) {
  if (str == null) return '';
  return String(str)
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;');
}

// reforço: Enter em qualquer input de texto de um form dispara o submit
// (exceto dentro de textarea, onde Enter deve continuar quebrando linha).
function enableEnterToSubmit(form) {
  form.querySelectorAll('input').forEach(input => {
    input.addEventListener('keydown', (e) => {
      if (e.key === 'Enter') {
        e.preventDefault();
        form.requestSubmit();
      }
    });
  });
}

// ---------- Boot ----------
checkSession();
