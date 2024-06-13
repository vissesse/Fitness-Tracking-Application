# Fitness-Tracking-Application
Aplicação de Rastreamento de Fitness  A aplicação de rastreamento de fitness é uma ferramenta que permite aos usuários monitorar suas atividades físicas, registrar treinos, definir metas e acompanhar seu progresso ao longo do tempo

Funcionalidades Principais

    Cadastro de Atividades Físicas
        Registro de diferentes tipos de atividades (corrida, caminhada, ciclismo, natação).
        Definição de parâmetros como distância, duração, calorias queimadas, etc.

    Registro de Treinos
        Permitir aos usuários registrar treinos específicos com data, hora e tipo de atividade.
        Armazenar detalhes adicionais como localização (via GPS), tempo, distância, ritmo, etc.

    Definição de Metas
        Definir metas pessoais, como correr 100 km por mês ou nadar 5 km por semana.
        Notificações quando as metas são alcançadas ou quando o usuário está perto de alcançá-las.

    Monitoramento de Progresso
        Estatísticas e gráficos mostrando o progresso do usuário ao longo do tempo.
        Comparação de desempenho em diferentes períodos.

    Integração com Dispositivos de Monitoramento
        Sincronização com smartwatches e outros dispositivos de monitoramento de atividades.
        Importação automática de dados de atividades.

    Compartilhamento em Redes Sociais
        Permitir que os usuários compartilhem suas conquistas e metas atingidas nas redes sociais.

Arquitetura do Projeto
Camadas do Sistema

    Presentation Layer (API)
        Controladores: Expor endpoints RESTful para interagir com o sistema.
        DTOs (Data Transfer Objects): Estruturas de dados para troca de informações entre a camada de apresentação e a aplicação.

    Application Layer
        Serviços de Aplicação: Coordenar a lógica de aplicação, orquestrar operações entre diferentes componentes.
        Mapeadores: Converter entre entidades de domínio e DTOs.

    Domain Layer
        Entidades: Representações de objetos do mundo real, como Atividade, Treino, Meta, Usuário.
        Agregados: Grupos de entidades que são tratadas como uma unidade (ex.: Meta composta por Atividade e Usuário).
        Repositórios: Interfaces para persistência e recuperação de dados.
        Serviços de Domínio: Implementação de lógica de negócio complexa.
        Eventos de Domínio: Notificações que algo importante aconteceu no domínio (ex.: meta atingida).

    Infrastructure Layer
        Repositórios Concretos: Implementações das interfaces de repositório usando um banco de dados.
        Integrações Externas: Serviços para sincronização com dispositivos de monitoramento e APIs de terceiros.

Modelagem de Domínios

    Domínio Atividade
        Entidade: Atividade
            Atributos: id, tipo, data, duração, distância, calorias, localização

    Domínio Treino
        Entidade: Treino
            Atributos: id, data, atividade, usuário
            Relacionamento: Treino pertence a um Usuário e contém uma Atividade

    Domínio Meta
        Entidade: Meta
            Atributos: id, descrição, tipo, objetivo, progresso, usuário
            Relacionamento: Meta pertence a um Usuário e está associada a uma ou mais Atividades

    Domínio Usuário
        Entidade: Usuário
            Atributos: id, nome, email, senha, atividades, treinos, metas

Implementação de TDD

Para garantir a qualidade do código e a correta implementação das funcionalidades, seguiremos a abordagem de Test-Driven Development (TDD), que inclui três etapas principais: Red, Green, Refactor.

    Red: Escrever um teste que falhe inicialmente.
    Green: Escrever código mínimo necessário para passar no teste.
    Refactor: Refatorar o código para melhorar a qualidade sem quebrar o teste.

Testes

    Testes Unitários
        Verificação da criação de uma nova Atividade com atributos válidos.
        Cálculo correto de calorias queimadas com base em distância e duração.
        Verificação da lógica de atualização de progresso de uma Meta.

    Testes de Integração
        Testar a integração entre o repositório de Atividades e a camada de aplicação.
        Verificação do fluxo completo de registro de um Treino e atualização de uma Meta.

    Testes de Aceitação
        Simulação do fluxo do usuário para registrar uma atividade, definir uma meta e monitorar o progresso.
        Testar a sincronização de dados de dispositivos externos e atualização do progresso.
