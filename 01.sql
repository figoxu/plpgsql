CREATE TABLE accounts(owner text,balance numeric) ;
INSERT INTO accounts VALUES('Bob',100); 
INSERT INTO accounts VALUES('Mary',200);

CREATE OR REPLACE FUNCTION transfer(
		i_payer text,
		i_recipient text,
		i_amount numeric(15,2)
	)
RETURNS text
AS
$$
DECLARE
	payer_bal numeric;
BEGIN
	SELECT balance INTO payer_bal
		FROM accounts
	WHERE owner = i_payer FOR UPDATE;
	IF NOT FOUND THEN
		RETURN 'Payer account not found';
	END IF;
	IF payer_bal < i_amount THEN
		RETURN 'Not enough funds';
	END IF;

	UPDATE accounts
		SET balance = balance + i_amount
	WHERE owner = i_recipient;
	IF NOT FOUND THEN
		RETURN 'Recipient does not exist';
	END IF;

	UPDATE accounts
		SET balance = balance - i_amount
	WHERE owner = i_payer;
	RETURN 'OK';
END;
$$ LANGUAGE plpgsql;


SELECT * FROM accounts;
SELECT * FROM transfer('Bob','Mary',14.00);
