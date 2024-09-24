-- 1.1 Gerar um valor inteiro
DO
$$
DECLARE
  numero_aleatorio INTEGER;
BEGIN
  numero_aleatorio := 1 + floor(random() * 100);
  RAISE NOTICE 'Numero inteiro gerado: %', numero_aleatorio;
END;
$$;

-- 1.2 Gerar um valor real
DO
$$
DECLARE
  numero_real NUMERIC;
BEGIN
  numero_real := 1 + random() * 9;
  RAISE NOTICE 'Numero real gerado: %', numero_real;
END;
$$;

-- 1.3 Gerar um valor real para Celsius e converter para Fahrenheit
DO
$$
DECLARE
  temp_celsius NUMERIC;
  temp_fahrenheit NUMERIC;
BEGIN
  temp_celsius := 20 + random() * 10;
  temp_fahrenheit := (temp_celsius * 1.8) + 32;
  RAISE NOTICE 'Temperatura: % Celsius = % Fahrenheit', temp_celsius, temp_fahrenheit;
END;
$$;

-- 1.4 Calcular o delta para uma equação do segundo grau
DO
$$
DECLARE
  a NUMERIC;
  b NUMERIC;
  c NUMERIC;
  delta NUMERIC;
BEGIN
  a := 1 + random() * 9;
  b := 1 + random() * 9;
  c := 1 + random() * 9;
  delta := b * b - (4 * a * c);
  RAISE NOTICE 'a: %, b: %, c: %, delta: %', a, b, c, delta;
END;
$$;

-- 1.5 Gerar um inteiro e calcular a raiz cúbica do antecessor e a raiz quadrada do sucessor
DO
$$
DECLARE
  numero INTEGER;
  raiz_cubica NUMERIC;
  raiz_quadrada NUMERIC;
BEGIN
  numero := 1 + floor(random() * 100);
  raiz_cubica := power(numero - 1, 1.0/3.0);
  raiz_quadrada := sqrt(numero + 1);
  RAISE NOTICE 'Numero: %, Raiz cubica do antecessor: %, Raiz quadrada do sucessor: %', numero, raiz_cubica, raiz_quadrada;
END;
$$;

-- 1.6 Gerar medidas de terreno e calcular valor total
DO
$$
DECLARE
  largura NUMERIC;
  altura NUMERIC;
  preco_metro_quadrado NUMERIC;
  area NUMERIC;
  valor_total NUMERIC;
BEGIN
  largura := 1 + random() * 9;
  altura := 1 + random() * 9;
  preco_metro_quadrado := 60 + random() * 10;
  area := largura * altura;
  valor_total := area * preco_metro_quadrado;
  RAISE NOTICE 'Area: % m², Preço por m²: %, Valor total: %', area, preco_metro_quadrado, valor_total;
END;
$$;

-- 1.7 Gerar ano de nascimento e ano atual, e calcular idade
DO
$$
DECLARE
  ano_nascimento INTEGER;
  ano_atual INTEGER;
  idade INTEGER;
BEGIN
  ano_nascimento := 1980 + floor(random() * 21);
  ano_atual := 2010 + floor(random() * 11);
  idade := ano_atual - ano_nascimento;
  RAISE NOTICE 'Ano de nascimento: %, Ano atual: %, Idade: % anos', ano_nascimento, ano_atual, idade;
END;
$$;
