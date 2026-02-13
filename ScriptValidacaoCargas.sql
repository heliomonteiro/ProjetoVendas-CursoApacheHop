-- STAGE Devolucoes
select count(*)
from stage.dbo.tb_devolucoes td ;

select count(*)
from dw.dbo.fDevolucoes;

---------------------------------------- Correção coluna DataDevolução
select *
from devolucoes d ;

ALTER TABLE devolucoes 
ALTER COLUMN "DataDevolucao" TYPE DATE 
USING TO_DATE("DataDevolucao", 'MM/DD/YYYY');

---------------------------------------- Metas
select 
count(*)	
from dw.dbo.fMetas;
-- 30 registros


select 
count(*)	
from dw.dbo.fMetas f
join dw.dbo.dCalendario d on d.[Data] = f.DataMeta;
-- 30 registros

----------------------------------------- historico produto

select *
from dw.dbo.dProduto dp
order by dp.IdProduto ;


select *
from stage.dbo.tb_produtos tp 
order by IdProduto ;

select * from stage.dbo.tb_produtos tp where tp.IdProduto = 214;
update stage.dbo.tb_produtos set PrecoProduto = 36 where IdProduto = 214; 



---------------------------------- validacao cargas
--- DATA DEVOLUCAO
select count(distinct DataDevolucao)
from dw.dbo.fDevolucoes;

select count(distinct DataDevolucao)
from dw.dbo.fDevolucoes fd
join dw.dbo.dCalendario dc
on fd.DataDevolucao = dc.[Data] ;

--- TERRITORIO
select count(distinct DataDevolucao)
from dw.dbo.fDevolucoes;

select count(distinct DataDevolucao)
from dw.dbo.fDevolucoes fd
join dw.dbo.dCalendario dc
on fd.DataDevolucao = dc.[Data] ;


--- DATA PEDIDO
select count(distinct DataPedido)
from dw.dbo.fVendas fv
join dw.dbo.dCalendario dc
on fv.DataPedido = dc.[Data] ;

--- TERRITORIO
select count(distinct Id_Territorio)
from dw.dbo.fVendas fv;

select count(distinct Id_Territorio)
from dw.dbo.fVendas fv
join dw.dbo.dTerritorio dt
on fv.Id_Territorio = dt.IdTerritorio  ;

select 
	fv.Id_Territorio
from dw.dbo.fVendas fv
left join dw.dbo.dTerritorio dt
on fv.Id_Territorio = dt.IdTerritorio
where dt.IdTerritorio is null;

--- PRODUTO
select count(distinct fv.Sk_Produto )
from dw.dbo.fVendas fv;

select count(distinct fv.Sk_Produto )
from dw.dbo.fVendas fv
join dw.dbo.dProduto dp 
on fv.Sk_Produto = dp.SkProduto   ;

--- CLIENTE
select count(distinct Id_Cliente)
from dw.dbo.fVendas fv;

select count(distinct Id_Cliente)
from dw.dbo.fVendas fv
join dw.dbo.dCliente dc
on fv.Id_Cliente  = dc.IdCliente   ;

--- SUBCATEGORIA
select count(distinct fv.Id_Subcategoria )
from dw.dbo.fVendas fv;

select count(distinct fv.Id_Subcategoria)
from dw.dbo.fVendas fv
join dw.dbo.dSubcategorias ds 
on fv.Id_Subcategoria    = ds.IdSubcategoria    ;