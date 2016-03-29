with recursive quadgrams(ttl, w1, w2, w3, w4) as
  (select 150, null, 'WAR', 'IS', 'PEACE'
     union all
   select ttl-1, w2, w3, w4,
          (select g4.word from words g1, words g2, words g3, words g4 where g2.id = g1.id + 1 and g3.id = g2.id + 1 and g4.id = g3.id + 1 and g1.word = w2 and g2.word = w3 and g3.word = w4 order by random() limit 1)
   from quadgrams where ttl > 0)
select w2 from quadgrams;

