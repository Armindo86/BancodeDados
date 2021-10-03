use mymundo;
select avg((datediff(now(), datanasc) div 365))
from pessoa
where dependente_de='1';
