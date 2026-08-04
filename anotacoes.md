-criei um schema pra ficar mais fácil de ficar resetando o banco se for necessário (dá só um drop schema)

# psql commands
psql -h localhost -p 5432 -U lucas gym-system   # conecta no banco de dados
createdb nome_do_banco                          # cria um banco
dropdb nome_do_banco                            # apaga um banco (cuidado)
psql -l                                         # lista todos os bancos
psql -d nome_do_banco                           # conecta no banco (abre o prompt interativo)
psql -d nome_do_banco -f arquivo.sql            # roda um script sem entrar no modo interativo

\l              lista bancos
\c nome_banco   troca de banco (conecta em outro)
\dt             lista as tabelas do banco atual
\d nome_tabela  mostra estrutura da tabela (colunas, tipos, PK, FK)
\d+ nome_tabela igual acima, mas com mais detalhe (tamanho, storage)
\i arquivo.sql  executa um arquivo .sql de dentro do psql
\q              sai do psql
\?              ajuda com todos os comandos do psql
\dn             lista esquemas





















# gym-system-backend

## PRÓXIMOS PASSOS
- Modelar algo pra armazenar o volume por músculo do treino, e isso precisa casar com exercícios compostos. 
Por exemplo: Supino reto 4x6, contabiliza 4 séries pra peito, 2 pra tríceps e 2 pra deltóide.

## FUTURO
- Modelar um nível a mais para periodização, divisão de clicos, com suas respectivas técnicas etc.

## ANOTAÇÕES
- Não to modelando o foco do exercício (tensão mecânica, estresse metabólico, alongamento). Isso pode ser inferido pelo range de reps e proximidade da falha (RIR || RPE). 

**Estímulo é inferido principalmente por:**
- Range de reps
- Proximidade da falha (RIR)
- Intervalo de descanso
- Técnica aplicada (dropset, restpause, etc)

**Regras gerais:**
- 6–8   reps, RIR 0–2  -> ênfase em tensão mecânica
- 8–12  reps, RIR 0–2  -> equilíbrio
- 12–15 reps, RIR 0–1  -> ênfase em estresse metabólico

