-- =========================================================
-- PARTE 2 – PROCEDURES COM VARIÁVEL DE CONTROLE
-- =========================================================


-- =========================================================
-- PROCEDURE 1 – CENÁRIO COMPANY
-- Gerenciamento da tabela employee
-- =========================================================

USE company_constraints;

DROP PROCEDURE IF EXISTS manage_employee;

DELIMITER $$

CREATE PROCEDURE manage_employee(
    IN opcao INT,                -- 1=SELECT | 2=INSERT | 3=UPDATE | 4=DELETE
    IN fname_p VARCHAR(15),
    IN lname_p VARCHAR(15),
    IN ssn_p CHAR(9),
    IN salary_p DECIMAL(10,2),
    IN dno_p INT
)
BEGIN

    -- =====================================================
    -- OPÇÃO 1 – SELECT
    -- =====================================================
    IF opcao = 1 THEN
        SELECT * FROM employee;

    -- =====================================================
    -- OPÇÃO 2 – INSERT
    -- =====================================================
    ELSEIF opcao = 2 THEN
        INSERT INTO employee (Fname, Lname, Ssn, Salary, Dno)
        VALUES (fname_p, lname_p, ssn_p, salary_p, dno_p);

        SELECT 'Funcionário inserido com sucesso' AS Mensagem;

    -- =====================================================
    -- OPÇÃO 3 – UPDATE
    -- =====================================================
    ELSEIF opcao = 3 THEN
        UPDATE employee
        SET Salary = salary_p
        WHERE Ssn = ssn_p;

        SELECT 'Salário atualizado com sucesso' AS Mensagem;

    -- =====================================================
    -- OPÇÃO 4 – DELETE
    -- =====================================================
    ELSEIF opcao = 4 THEN
        DELETE FROM employee
        WHERE Ssn = ssn_p;

        SELECT 'Funcionário removido com sucesso' AS Mensagem;

    ELSE
        SELECT 'Opção inválida. Use 1=SELECT, 2=INSERT, 3=UPDATE ou 4=DELETE.' AS Erro;
    END IF;

END $$

DELIMITER ;


-- =========================================================
-- CHAMADAS DE TESTE – COMPANY
-- =========================================================

-- SELECT
CALL manage_employee(1, NULL, NULL, NULL, NULL, NULL);

-- INSERT
CALL manage_employee(2, 'Lucas', 'Silva', '999999999', 50000.00, 1);

-- UPDATE
CALL manage_employee(3, NULL, NULL, '999999999', 60000.00, NULL);

-- DELETE
-- CALL manage_employee(4, NULL, NULL, '999999999', NULL, NULL);



-- =========================================================
-- PROCEDURE 2 – CENÁRIO E-COMMERCE
-- Gerenciamento da tabela product
-- =========================================================

USE ecommerce;

DROP PROCEDURE IF EXISTS manage_product;

DELIMITER $$

CREATE PROCEDURE manage_product(
    IN opcao INT,                 -- 1=SELECT | 2=INSERT | 3=UPDATE | 4=DELETE
    IN pname_p VARCHAR(60),
    IN category_p VARCHAR(45),
    IN id_p INT
)
BEGIN

    -- =====================================================
    -- OPÇÃO 1 – SELECT
    -- =====================================================
    IF opcao = 1 THEN
        SELECT * FROM product;

    -- =====================================================
    -- OPÇÃO 2 – INSERT
    -- =====================================================
    ELSEIF opcao = 2 THEN
        INSERT INTO product (Pname, category)
        VALUES (pname_p, category_p);

        SELECT 'Produto inserido com sucesso' AS Mensagem;

    -- =====================================================
    -- OPÇÃO 3 – UPDATE
    -- =====================================================
    ELSEIF opcao = 3 THEN
        UPDATE product
        SET category = category_p
        WHERE idProduct = id_p;

        SELECT 'Produto atualizado com sucesso' AS Mensagem;

    -- =====================================================
    -- OPÇÃO 4 – DELETE
    -- =====================================================
    ELSEIF opcao = 4 THEN
        DELETE FROM product
        WHERE idProduct = id_p;

        SELECT 'Produto removido com sucesso' AS Mensagem;

    ELSE
        SELECT 'Opção inválida. Use 1=SELECT, 2=INSERT, 3=UPDATE ou 4=DELETE.' AS Erro;
    END IF;

END $$

DELIMITER ;


-- =========================================================
-- CHAMADAS DE TESTE – E-COMMERCE
-- =========================================================

-- SELECT
CALL manage_product(1, NULL, NULL, NULL);

-- INSERT
CALL manage_product(2, 'Notebook Gamer', 'Eletrônico', NULL);

-- UPDATE
CALL manage_product(3, NULL, 'Móveis', 1);

-- DELETE
-- CALL manage_product(4, NULL, NULL, 1);