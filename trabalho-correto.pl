doenca(gripe) :- febre, tosse.
doenca(infeccao_viral) :- febre, dor_de_garganta.
doenca(enxaqueca) :- dor_de_cabeca.

perguntar(febre) :- write('Voc� tem febre? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(febre); true).
perguntar(tosse) :- write('Voc� tem tosse? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(tosse); true).
perguntar(dor_de_cabeca) :- write('Voc� tem dor de cabe�a? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(dor_de_cabeca); true).
perguntar(dor_de_garganta) :- write('Voc� tem dor de garganta? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(dor_de_garganta); true).

problema(bateria_fraca) :- motor_nao_liga, luzes_fracas.
problema(freio_desgastado) :- barulho_ao_frear, pedal_freio_macio.

perguntar(motor_nao_liga) :- write('O motor n�o est� ligando? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(motor_nao_liga); true).
perguntar(luzes_fracas) :- write('As luzes est�o fracas? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(luzes_fracas); true).
perguntar(barulho_ao_frear) :- write('H� barulho ao frear? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(barulho_ao_frear); true).
perguntar(pedal_freio_macio) :- write('O pedal de freio est� macio? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(pedal_freio_macio); true).

recomendar('1984') :- genero(ficcao), interesse(politica).
recomendar('Sapiens') :- genero(historia), interesse(ciencia).

perguntar_genero :- write('Qual g�nero voc� prefere? (ficcao, historia, ciencia, etc.)'), read(Genero), assert(genero(Genero)).
perguntar_interesse :- write('Sobre o que voc� tem interesse? (politica, ciencia, etc.)'), read(Interesse), assert(interesse(Interesse)).

treino(hipertrofia) :- objetivo(ganhar_massa), experiencia(intermediario).
treino(perda_de_peso) :- objetivo(emagrecer), disponibilidade(tempo_limitado).


perguntar_objetivo :- write('Qual � seu objetivo? (ganhar_massa, emagrecer, etc.)'), read(Objetivo), assert(objetivo(Objetivo)).

perguntar_experiencia :- write('Qual seu n�vel de experi�ncia? (iniciante, intermediario, avan�ado)'), read(Experiencia), assert(experiencia(Experiencia)).

perguntar_tempo :- write('Quanto tempo voc� tem dispon�vel por semana? (limitado, normal, bastante)'), read(Tempo), assert(disponibilidade(Tempo)).

suspeito(jose) :- impressao_digital(lugar_crime), motivo(financeiro).

teoria(crime_passional) :- testemunha(visto_discutindo), relacao(intima).

perguntar_impressao :- write('H� impress�o digital no local do crime? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(impressao_digital(lugar_crime)); true).
perguntar_motivo :- write('O motivo do crime parece ser financeiro? (sim/nao)'), read(Resposta), (Resposta == sim -> assert(motivo(financeiro)); true).


diagnosticar :-
    perguntar(febre),
    perguntar(tosse),
    perguntar(dor_de_cabeca),
    perguntar(dor_de_garganta),
    (doenca(gripe) -> write('Voc� tem Gripe.');
     doenca(infeccao_viral) -> write('Voc� tem Infec��o Viral.');
     doenca(enxaqueca) -> write('Voc� tem Enxaqueca.');
     write('Consulte um m�dico para um diagn�stico preciso.')).

diagnosticar_veiculo :-
    perguntar(motor_nao_liga),
    perguntar(luzes_fracas),
    perguntar(barulho_ao_frear),
    perguntar(pedal_freio_macio),
    (problema(bateria_fraca) -> write('Problema: Bateria fraca.');
     problema(freio_desgastado) -> write('Problema: Freio desgastado.');
     write('Verifique o carro com um mec�nico para mais informa��es.')).


recomendar_livro :-
    perguntar_genero,
    perguntar_interesse,
    (recomendar('1984') -> write('Recomenda��o: 1984, de George Orwell.');
     recomendar('Sapiens') -> write('Recomenda��o: Sapiens, de Yuval Noah Harari.');
     write('Desculpe, n�o temos uma recomenda��o espec�fica para seus interesses.')).

recomendar_treino :-
    perguntar_objetivo,
    perguntar_experiencia,
    perguntar_tempo,
    (treino(hipertrofia) -> write('Recomenda��o: Plano de treino para hipertrofia.');
     treino(perda_de_peso) -> write('Recomenda��o: Plano de treino para perda de peso.');
     write('Consulte um personal trainer para um plano mais espec�fico.')).

analise_caso :-
    perguntar_impressao,
    perguntar_motivo,
    (suspeito(jose) -> write('Suspeito identificado: Jos�.');
     teoria(crime_passional) -> write('Teoria: Crime passional.');
     write('A investiga��o precisa continuar para mais informa��es.')).
