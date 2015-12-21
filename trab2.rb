$elementos = Array.new
$verdade = Array.new
$falso = Array.new

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
	$falso.delete(elemento)
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
	$verdade.delete(elemento)
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
	entrada = entrada.delete(' ')
  	puts "Testando sat instancia:" + line_num.to_s
	entrada =  entrada.tr("\n",'')
	sat = entrada.split('&')
	
	getVariaveis(sat)
	
	elementosArray = $elementos
	
	
	if satTeste(elementosArray,sat)
		puts "Sat Verdadeiro"
	else
		puts "Sat Falso"
	end
	
	
	$elementos = Array.new
	
	elementosArray = nil
	
	sat = ""
	
	line_num+=1
end

