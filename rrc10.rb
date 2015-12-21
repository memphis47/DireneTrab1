$elementos = Array.new
$verdade = Array.new
$falso = Array.new
$inst = 0

def getVariaveis(sat)  
	sat.each do|cls|
		newclausulas = cls.tr('()', '')
		variaveis = newclausulas.split('#')
		variaveis.each do|elemento|
			elemento = elemento.tr(' ','')
			elemento = elemento.tr('~','')
			if !$elementos.include? elemento
				$elementos.push elemento
			end
		end
	end
end

def satTeste(elementos,pending)
	if elementos.empty? and !pending.empty?
		return false
	elsif pending.empty?
		return true
	else		
		eleAux = elementos.dup
		head = elementos.first
		elementos.shift
		if(!satTeste(elementos,verifyTrue(pending,head)))
			eleAux.shift
			if(!satTeste(eleAux,verifyFalse(pending,head)))
				return false
			end
		end
		return true
	end
end

def verifyTrue(cls,elemento)
	if $falso.delete(elemento) != nil
		$inst +=1
	end
	$verdade.push(elemento)
	aux = cls.dup
	cls.each do |clauses|
		newclausulas = clauses.tr('()', '')
		
		negelem = "~"+elemento
		newclausulas.slice! negelem
		ncls = newclausulas.split('#')
		ncls.each do |vars|
			if vars.eql? elemento
				aux.delete(clauses)
			end
		end	
	end
	return aux
end

def verifyFalse(cls,elemento)
	if $verdade.delete(elemento) != nil
		$inst +=1
	end
	$falso.push(elemento)
	aux = cls.dup
	cls.each do |clauses|
		newclausulas = clauses.tr('()', '')
		ncls = newclausulas.split('#')
		ncls.each do |vars|
			if vars.eql? '~'+elemento
				aux.delete(clauses)
			end
		end	
	end
	return aux
end


line_num=1
text=File.open('sat.in').read
text=text.gsub(/(\r|\n)+/,"\n")
text.each_line do |entrada|
	puts ""
	entrada = entrada.delete(' ')
  	puts "Testando sat instancia " + line_num.to_s
	entrada =  entrada.tr("\n",'')
	sat = entrada.split('&')
	
	getVariaveis(sat)
	
	elementosArray = $elementos
	
	start = Time.now
	if satTeste(elementosArray,sat)
		puts "Sat"
	else
		puts "Unsat"
	end
	finish = Time.now
	
	diff = finish - start
	
	puts "Tempo de execucao = %3.4f segundo(s)." % diff
	
	puts "Instanciacoes = "+ $inst.to_s
	
	
	$elementos = Array.new
	
	elementosArray = nil
	
	sat = ""
	
	line_num+=1
	$inst = 0
end

