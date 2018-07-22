SELECT
	ual2. M,
	ual2.ml1,
	ual2.ml2,
	ubl2.ml2,
	ubl2.ml1,
	ubl2. M
FROM
	(
				SELECT
					b.uid M,
					A .uid ml1,
					A .friend ml2
				FROM
					bit_user_friend A,(
					SELECT
						uid,
						friend
					FROM
						bit_user_friend
					WHERE
						uid = 1
			) b
		WHERE A .uid = b.friend AND A .friend != 1
	) ual2,
	(
				SELECT
					b.uid M,
					A .uid ml1,
					A .friend ml2
				FROM
					bit_user_friend A,
					(
						SELECT
							uid,
							friend
						FROM
							bit_user_friend
						WHERE
							uid = 100
					) b
				WHERE
					A .uid = b.friend
				AND A .friend != 100
			) ubl2
		WHERE
			ual2.ml2 = ubl2.ml2;

