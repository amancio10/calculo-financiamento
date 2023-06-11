# Cálculo de financiamento 🖩
### Calculadora para Cálculo de financiamento

##

Desenvolvi essa calculadora em Lazarus (Objeto pascal) para resolver um problema de conflito de informações da organização onde trabalho (em 2023); o conflito era entre o cálculo do sistema que estava sendo usado e o cálculo feito pelos usuários para conciliação das informações; o cálculo usado pelos usuários era cálculo de juros composto; após análise identificamos que o correto seria usar cálculo de financiamento para esta conciliação.

Por ser um cálculo mais complexo, desenvolvi esta calculadora para uso dos usuários internamente.

##

Abaixo está a lógica dos cálculos:

##

![Valor da Parcela](https://github.com/amancio10/calculo-financiamento/assets/48102777/5ab2bcb2-ce44-4b36-bba5-a54f0e083b48)

- **P** é o valor da parcela;
- **J** é a taxa de juros mensal, calculada como a porcentagem de juros por mês dividida por 100;
- **V** é o valor do bem;
- **N** é o número de meses.

##

![total de Juros](https://github.com/amancio10/calculo-financiamento/assets/48102777/dbdbc4d1-9430-4209-a8f9-1260456a5335)

- Para calcular o total de juros (TJ), multiplica-se o valor da parcela pelo número de meses e subtrair o valor do bem.

##

![Valor da Parcela](https://github.com/amancio10/calculo-financiamento/assets/48102777/62865504-3aa7-4a9b-8de3-61e71ed7fc88)

- E para calcular o montante (M), soma-se o valor do bem ao total de juros.
