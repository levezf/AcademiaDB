# AcademiaDB
Banco de Dados para uma Academia - Projeto de Banco de Dados I 

# 1. Especificação do Problema
# Esta seção deve descrever detalhadamente as características do problema do mundo real que será modelado. Em especial devem ser especificados: 
# i. O(s) objetivo(s) da modelagem sendo realizada; 
# ii. As características importantes a respeito das entidades, relacionamentos e atributos que serão modelados; 
# iii. As principais consultas a serem respondidas no final do projeto.

Deseja-se construir um sistema de armazenamento de informações de uma academia. A academia possui funcionários, alunos, equipamentos e salas de dança. 
	A academia possui dois planos, comum e vip. O aluno do plano comum só pode frequentar a academia de segunda-feira à sexta-feira das 6h30 às 16h. Já o aluno do plano Vip pode frequentar a academia de segunda-feira à sexta-feira das 6h30 às 23h e de sábado dás 9h às 18h.
	Para os funcionários, devem ser registrados o CPF, endereço (cep, logradouro, número,bairro), nome, telefones, a carga horária, o e-mail e o cargo.
Para o aluno, deve ser cadastrado, o CPF, nome, endereço  (cep, logradouro, número,bairro), telefones, data de nascimento e e-mail, além do plano escolhido pelo aluno.
	Cada equipamento da academia possui um código identificador, o nome, e sua descrição.
Cada sala de dança, possui um número único e está sempre a disposição dos alunos. Mais de um aluno pode usar a mesma sala e não há professores específicos para cada sala.
	Os equipamentos podem ser vendidos ou comprados pelo proprietário da academia, devendo ser registrado a data de compra ou a data de venda, preço de compra ou o preço de venda.
	Apenas um funcionário é responsável pela elaboração de treinos para o aluno, no entanto, qualquer funcionário pode orientar um aluno durante a realização de seu treino. Além disso, a academia, permite que o aluno utilize o espaço e os equipamentos, mesmo que não possua um treino elaborado por um funcionário. 
	A academia oferece duas modalidades de treino diferentes para o aluno, o qual só pode optar por uma das duas, musculação ou dança. Sendo que, para a musculação deve ser armazenado o tempo de descanso e os nomes dos exercícios que o aluno deve fazer. Já para a dança,  deve ser registrado o tempo de aula.
