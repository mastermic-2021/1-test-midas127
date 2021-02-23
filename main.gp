str2ascii(s)=Vec(Vecsmall(s));

ascii2str(v)=Strchr(v);

encode(s) = {
  [ if(c==32,0,c-96) | c <- str2ascii(s), c==32 || 97<=c && c<= 122 ];
}

decode(v) = {
  ascii2str([ if(c==0,32,c+96) | c <- v]);
}

dechiffre(v, key) = {
	a = #key;
	l = [];
	for (i=1, #v, d = ((i-1)%a)+1; c = key[d]; v[i] = (-c + v[i]+27)%27;);
	return(v);
}

text=readstr("input.txt")[1];

\\print(text);

messagesale=encode(text);

\\print(messagesale);

k=encode("haricot");

message=dechiffre(messagesale, k);

\\print(message);

clair=decode(message);

print(clair);

\\ resoudre l'exercice, bien mettre des ; a la fin des lignes

\\ a la fin, faire simplement
\\ print(clair);
