CREATE OR REPLACE FUNCTION gen_user_bitmap(
    uid int
)
RETURNS varbit
AS $$
DECLARE
    positions int[];
    row bit_user_friend%rowtype;
	_query text;
	bm varbit;
BEGIN
	select CONCAT('select * from bit_user_friend where uid=',uid) into _query;
    FOR row in EXECUTE _query
    LOOP
	    RAISE NOTICE '%',row.friend;
        select positions|| row.friend into positions;
    END LOOP;
	RAISE NOTICE '%',positions;
	bm=set_bit_by_positions(80000000,positions);
    RETURN bm;
END;
$$ LANGUAGE plpgsql;

