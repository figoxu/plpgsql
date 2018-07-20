CREATE OR REPLACE FUNCTION set_bit_by_positions(
	len int,
	positions int[]
)
RETURNS varbit
AS $$
DECLARE
	d varbit;
	pos int;
	_query text;
BEGIN
	select CONCAT('select 0::bit(',len,') ') into _query;
	EXECUTE _query into d;
	RAISE NOTICE 'HELLO';
	FOR i IN 1 .. array_upper(positions, 1)
	LOOP
		RAISE NOTICE 'INVOKE';
		select into d set_bit(d,positions[i],1);
		RAISE NOTICE '%', i;
	END LOOP;
	RETURN d;
END;
$$ LANGUAGE plpgsql;
select  set_bit_by_positions(4,'{0,1,3}');