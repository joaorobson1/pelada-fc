
export const LIMITE_JOGADORES = 5;

export const CORES_TIMES = [
  'Azul',
  'Amarelo',
  'Preto',
  'Vermelho',
  'Verde',
  'Roxo',
  'Laranja',
];

export interface Jogador {
  id: string;
  nome: string;
}

export interface Time {
  cor: string;
  jogadores: Jogador[];
  goleiro?: Jogador;
}

export function criarTimesIniciais(): Time[] {
  return CORES_TIMES.slice(0, 3).map(cor => ({
    cor,
    jogadores: [],
  }));
}

export function sortearJogador(
  timesAtuais: Time[],
  jogador: Jogador
): Time[] {
  const times = timesAtuais.map(time => ({
    ...time,
    jogadores: [...time.jogadores],
  }));

  if (!jogador.nome.trim()) {
    throw new Error('Informe o nome do jogador.');
  }

  const jaSorteado = times.some(time =>
    time.jogadores.some(
      participante => participante.id === jogador.id
    )
  );

  if (jaSorteado) {
    throw new Error('Este jogador já foi sorteado.');
  }

  let disponiveis = times.filter(
    time => time.jogadores.length < LIMITE_JOGADORES
  );

  if (disponiveis.length === 0) {
    const proximaCor = CORES_TIMES[times.length];

    if (!proximaCor) {
      throw new Error('Limite de equipes atingido.');
    }

    const novoTime: Time = {
      cor: proximaCor,
      jogadores: [],
    };

    times.push(novoTime);
    disponiveis = [novoTime];
  }

  const indice = Math.floor(
    Math.random() * disponiveis.length
  );

  disponiveis[indice].jogadores.push(jogador);

  return times;
}
