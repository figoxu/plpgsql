create or replace function get_bit_positions(varbit) returns int[] as $$
select array(
  select i
  from generate_series(1, length($1)) as i
  where substring($1 from i for 1) = '1'
);
$$ language sql immutable;

select get_bit_positions( '00110101');

-- 参考资料 : https://stackoverflow.com/questions/16221588/convert-bit-string-to-array-in-postgresql