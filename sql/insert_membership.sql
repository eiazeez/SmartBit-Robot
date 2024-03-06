BEGIN;

DELETE FROM accounts
WHERE email = 'membership@test.com';

WITH new_account AS (
    INSERT INTO accounts (name, email, cpf)
    VALUES ('Membership Test', 'membership@test.com', '444.644.470-07')
    RETURNING id
)

INSERT INTO memberships (account_id, plan_id, credit_card, price, status)
SELECT id, 1, '4242', 99.99, true
FROM new_account

COMMIT