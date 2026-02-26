-- =========================================================
-- PARTE 1 – CRIAÇÃO DE ÍNDICES E QUERIES (CENÁRIO COMPANY)
-- =========================================================

USE company_constraints;

-- =========================================================
-- ÍNDICE 1
-- Coluna: employee.Dno
-- Motivo:
-- Utilizada em JOIN com departament e em agrupamentos.
-- Índice BTREE (padrão InnoDB) melhora performance em
-- buscas por igualdade e GROUP BY.
-- =========================================================
CREATE INDEX idx_employee_dno 
ON employee(Dno);

-- =========================================================
-- ÍNDICE 2
-- Coluna: dept_locations.Dnumber
-- Motivo:
-- Utilizada em JOIN com departament para recuperar
-- localizações por departamento.
-- =========================================================
CREATE INDEX idx_dept_locations_dnumber 
ON dept_locations(Dnumber);

-- =========================================================
-- ÍNDICE 3
-- Coluna: dept_locations.Dlocation
-- Motivo:
-- Permite ordenação e filtros por cidade.
-- =========================================================
CREATE INDEX idx_dept_locations_dlocation 
ON dept_locations(Dlocation);

-- =========================================================
-- PERGUNTA 1
-- Qual o departamento com maior número de pessoas?
-- =========================================================
SELECT 
    d.Dname,
    COUNT(e.Ssn) AS total_funcionarios
FROM departament d
JOIN employee e 
    ON d.Dnumber = e.Dno
GROUP BY d.Dname
ORDER BY total_funcionarios DESC
LIMIT 1;

-- =========================================================
-- PERGUNTA 2
-- Quais são os departamentos por cidade?
-- (Corrigido: Dlocation está na tabela dept_locations)
-- =========================================================
SELECT 
    d.Dname,
    dl.Dlocation
FROM departament d
JOIN dept_locations dl 
    ON d.Dnumber = dl.Dnumber
ORDER BY dl.Dlocation;

-- =========================================================
-- PERGUNTA 3
-- Relação de empregados por departamento
-- =========================================================
SELECT 
    d.Dname,
    e.Fname,
    e.Lname,
    e.Salary
FROM employee e
JOIN departament d 
    ON e.Dno = d.Dnumber
ORDER BY d.Dname, e.Lname;

-- =========================================================
-- Verificação dos índices criados
-- (Tirar print para anexar no desafio)
-- =========================================================
SHOW INDEX FROM employee;
SHOW INDEX FROM dept_locations;

-- =========================================================
-- OBSERVAÇÃO FINAL
-- Índices foram criados apenas nas colunas envolvidas
-- em JOINs e filtros relevantes.
-- Não foram criados índices desnecessários em colunas
-- com baixa seletividade.
-- =========================================================