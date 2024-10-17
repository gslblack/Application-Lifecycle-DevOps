CREATE TABLE T_CAMINHOES_COLETA (
    caminhao_id INT PRIMARY KEY,
    placa VARCHAR(20),
    capacidade INT,
    latitude DECIMAL(10,8),
    longitude DECIMAL(11,8),
    data_atualizacao DATE
);

CREATE TABLE T_ROTAS (
    rota_id INT PRIMARY KEY,
    descricao VARCHAR(100),
    caminhao_id INT,
    data DATE,
    latitude DECIMAL(10, 8),
    longitude DECIMAL(11, 8),
    capacidade_atual DECIMAL,
    FOREIGN KEY (caminhao_id) REFERENCES T_CAMINHOES_COLETA(caminhao_id)
);

CREATE TABLE T_AGENDAMENTO_COLETA (
    agendamento_id INT PRIMARY KEY,
    rota_id INT,
    data_agendada DATE,
    status VARCHAR(20),
    FOREIGN KEY (rota_id) REFERENCES T_ROTAS(rota_id)
);

CREATE TABLE T_MORADORES (
    morador_id INT PRIMARY KEY,
    nome VARCHAR(50),
    endereco VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE T_NOTIFICACOES (
    notificacao_id INT PRIMARY KEY,
    morador_id INT,
    agendamento_id INT,
    data_envio DATE,
    mensagem VARCHAR(255),
    FOREIGN KEY (morador_id) REFERENCES T_MORADORES(morador_id),
    FOREIGN KEY (agendamento_id) REFERENCES T_AGENDAMENTO_COLETA(agendamento_id)
);

CREATE TABLE T_RESIDUOS (
    residuo_id INT PRIMARY KEY,
    rota_id INT,
    volume_residuo DECIMAL,
    FOREIGN KEY (rota_id) REFERENCES T_ROTAS(rota_id)
);
