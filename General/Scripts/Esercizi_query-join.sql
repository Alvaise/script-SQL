/*1) visualizzare la "ragione_sociale" delle aziende che hanno degli 
 * 
 investimenti, con i "nomi" di tutti i propri investimenti*/
select
	fa.ragione_sociale,
	fi.nome
from 
	ft_azienda as fa
inner join 
	ft_investimento fi on 
		fa.id = fi.azienda;
/*2) visualizzare i nomi degli investimenti che hanno dei ROI con i  "nomi" dei propri ROI*/
select 
	fi.nome,
	fr.valore as valore_roi
from 
	ft_investimento as fi 
inner join 
	ft_roi as fr ON 
		fi.id =fr.investimento

/*3) visualizzare la "ragione_sociale" e "settore" delle aziende che hanno dei prodotti, con i "nomi" e "prezzi" dei propri prodotti*/
select 
	fa.ragione_sociale,
	fp.nome,
	fp.prezzo 
from 
	ft_azienda as fa
inner join
	ft_prodotto as fp on
	fa.id =fp.azienda;

/*4) visualizzare il nome dei prodotti che hanno una categoria ed il nome delle relative categorie di appartenenza*/
select 
	fp.nome as nome_prodotto, 
	dc.nome as nome_categoria
from 
	ft_prodotto as fp
inner join 
	dm_categoria as dc on
		fp.categoria=dc.id;
	
/*5) visualizzare il nome dei prodotti che hanno delle transazioni e la "data" e "importo" delle relative transazioni*/
select 
	fp.nome as prodotto,
	ft.data_transazione,
	ft.importo 
from 
ft_prodotto as fp
inner join
	ft_transazione as ft ON 
		ft.prodotto =fp.id;
	
/*6) visualizzare la "ragione_sociale" di tutte le aziende ed i "nomi" degli investimenti laddove presenti.*/
select 
	fa.ragione_sociale,
	fi.nome as investimento
from 
ft_azienda as fa
left join
	ft_investimento as fi on
		fa.id = fi.azienda; 
		
		
/*7) visualizzare i nomi di tutti gli investimenti ed i "nomi" dei ROI laddove presenti*/
select
	fi.nome,
	fr.valore as ROI
from 
	ft_investimento as fi
left join 
	ft_roi as fr on
		fi.id = fr.investimento;
	
/*8) visualizzare la "ragione_sociale" e "settore" di tutte le aziende con i "nomi" e "prezzi" dei  prodotti laddove presenti.*/
select 
	fa.ragione_sociale,
	fa.settore,
	fp.nome,
	fp.prezzo
from 
	ft_azienda as fa
left join
	ft_prodotto as fp ON 
		fa.id =fp.azienda;
/*9) visualizzare il nome di tutti i prodotti ed il nome delle relative categorie se presenti*/
select
	fp.nome as prodotto ,
	dc.nome as categoria 
from
	ft_prodotto as fp
left join
	dm_categoria as dc ON 
		fp.categoria =dc.id;

/*10) visualizzare il nome di tutti i prodotti e la "data" e "importo" delle transazioni laddove presenti*/
select 
	fp.nome as prodotto,
	ft.data_transazione,
	ft.importo
from 
	 ft_prodotto as fp
left join
	ft_transazione as ft ON 
		fp.id =ft.prodotto;
/*11) visualizzare i "nomi" degli investimenti  e la "ragione_sociale" delle aziende.
 * 
 * Le aziende ci devono essere tutte, mentre degli investimenti soltanto quelli che hanno una azienda.
 * */
select
	fi.nome as nome_investimento,
	fa.ragione_sociale as azienda_nome
from 
	ft_investimento as fi
right join
	ft_azienda as fa on
		fa.id =fi.azienda;
/*12) visualizzare il testo delle recensioni ed i nomi dei clienti che le hanno fatte.

I clienti ci devono essere tutti mentre delle recensioni soltanto quelle che sono state fatte dai clienti.*/
select
	fr.testo as recensioni,
	fc.nome as cliente_nome
from 
	ft_recensione as fr
right join
	ft_cliente as fc on
		fc.id =fr.cliente;
	
/*13) visualizzare il voto delle recensioni ed i nomi dei prodotti.

I prodotti ci devono essere tutti mentre delle recensioni soltanto quelle che sono state fatte su dei prodotti.*/
select 
	fr.voto as voto,
	fp.nome as nome_prodotto
from 
	ft_recensione as fr
right join
	ft_prodotto as fp on
		fp.id =fr.prodotto;

/*14) visualizzare la descrizione dei ROI ed il nome degli investimenti.

Gli investimenti devono esseci tutti mentre dei ROI soltanto quelli che hanno un collegamento con gli investimenti*/
select 
	fr.descrizione as descrizione ,
	fi.nome as nome_investimento
from 
	ft_roi as fr
right join
	ft_investimento as fi on
		fi.id = fr.investimento;

/*15) visualizzare i dettagli delle aziende che non hanno investimenti.*/
select 
	fa.* as azienda_no_investimenti
from 
	ft_azienda as fa
left join
	ft_investimento as fi on
		fa.id = fi.azienda 
		where fi.azienda is null;
/*16) visualizzare i dettagli degli investimenti che non hanno ROI.*/
select
	fi.*
from 
	ft_investimento as fi
left join
	ft_roi as fr on
		fi.id = fr.investimento 
		where fr.investimento is null;

/*17) visualizzare i dettagli delle aziende che non hanno prodotti.*/
select
	fa.*
from 
	ft_azienda as fa
left join
	ft_prodotto as fp on
		fa.id = fp.azienda
		where fp.azienda is null;

/*18) visualizzare i dettagli dei prodotti che non sono presenti in nessuna transazione.*/
select 
	fp.*,
	ft.prodotto 
from 
	ft_prodotto as fp
left join
	ft_transazione as ft on
		fp.id = ft.prodotto 
		where ft.prodotto is null;
	
/*19) visualizzare i dettagli dei clienti che non hanno effettuato recensioni.*/
select 
	fc.*
from 
	ft_cliente as fc
left join
	ft_recensione as fr on
		fc.id = fr.cliente
		where fr.cliente is null;
/*20)visualizzare i dettagli delle aziende che non hanno investimenti, scrivendo prima la tabella degli investimenti.*/
select
	fa.*,
	fi.nome
from
	ft_investimento as fi
right join 
	ft_azienda as fa on
		fi.azienda =fa.id 
		where fi.id is null;
	

/*21) visualizzare i dettagli delle aziende che non hanno investimenti, scrivendo prima la tabella degli investimenti.*/
select
	fi.*
from 
	ft_roi as fr
right join
	ft_investimento as fi on
		fr.investimento = fi.id 
		where fr.investimento  is null;
/*22) visualizzare i dettagli degli investimenti che non hanno ROI, scrivendo prima la tabella dei ROI.*/

/*23) visualizzare i dettagli delle aziende che non hanno prodotti, scrivendo prima la tabella dei prodotti.*/

/*24) visualizzare i dettagli dei prodotti che non sono presenti in nessuna transazione, scrivendo prima la tabella delle transazioni.*/

/*25) visualizzare i dettagli dei clienti che non hanno effettuato recensioni, scrivendo prima la tabella delle recensioni.*/


/*FULL JOIN

20) visualizzare i dettagli di tutte le aziende e tutti gli investimenti.*/

/*21) visualizzare i dettagli di tutti gli investimenti e tutti i ROI.*/

/*22) visualizzare i dettagli di tuttie le aziende e tutti i prodotti.*/

/*23) visualizzare i dettagli di tutti i prodotti e tutte le transazioni.*/

/*24) visualizzare i dettagli di tutti i clienti e tutte le recensioni.*/
	
/*FULL JOIN esclusiva*/

/*26) visualizzare i dettagli di tutte le aziende che non hanno investimenti e tutti gli investimenti che non hanno aziende.*/

/*27) visualizzare i dettagli di tutti gli investimenti che non hanno ROI e tutti i ROI che non hanno investimenti.*/

/*28) visualizzare i dettagli di tuttie le aziende che non hanno prodotti e tutti i prodotti che non hanno aziende.*/

/*29) visualizzare i dettagli di tutti i prodotti che non hanno transizioni e tutte le transazioni che non hanno prodotti.*/

/*30) visualizzare i dettagli di tutti i clienti che non hanno recensioni e tutte le recensioni che non hanno clienti.*/

	
	
	
	
	
	
--es extra	
select 
	fc.*,
	fr.testo as recensione
from 
	ft_cliente  as fc
left join
	ft_recensione as fr ON 
		fc.id = fr.cliente
where 
	fr.cliente is null;

select 
	fr.*
from 
	ft_cliente  as fc
right join
	ft_recensione as fr ON 
		fc.id = fr.cliente
where 
	fc.id  is null;