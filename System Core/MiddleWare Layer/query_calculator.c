#include"query_calculator.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

double evaluate_expression(char* expr);

int main() {
	while(1)
	{
    char expr[100]; 
    printf("Enter the expression: ");
    fgets(expr, sizeof(expr), stdin); 
    double result = evaluate_expression(expr);
    printf("Result: %0.3f\n", result);
}
    return 0;
}

double evaluate_expression(char* expr) {
    char* ptr = expr;
    double num_stack[100];
    char op_stack[100];
    int num_top = -1;
    int op_top = -1;

    while (*ptr != '\0') {
        if (isdigit(*ptr)) {
            num_top++;
            num_stack[num_top] = strtod(ptr, &ptr);
        }
        else if (*ptr == '+' || *ptr == '-' || *ptr == '*' || *ptr == '/') {
            while (op_top >= 0 && ((op_stack[op_top] == '*' || op_stack[op_top] == '/') || (op_stack[op_top] == '+' || op_stack[op_top] == '-') && (*ptr == '+' || *ptr == '-'))) {
                double num2 = num_stack[num_top];
                num_top--;
                double num1 = num_stack[num_top];
                num_top--;
                char op = op_stack[op_top];
                op_top--;
                double result = 0.0;
                switch (op) {
                    case '+':
                        result = num1 + num2;
                        break;
                    case '-':
                        result = num1 - num2;
                        break;
                    case '*':
                        result = num1 * num2;
                        break;
                    case '/':
                        result = num1 / num2;
                        break;
                }
                num_top++;
                num_stack[num_top] = result;
            }
            op_top++;
            op_stack[op_top] = *ptr;
            ptr++;
        }
        else {ptr++;}
    }

    while (op_top >= 0) {
        double num2 = num_stack[num_top];
        num_top--;
        double num1 = num_stack[num_top];
        num_top--;
        char op = op_stack[op_top];
        op_top--;
        double result = 0.0;
        switch (op) {
            case '+':
                result = num1 + num2;
                break;
            case '-':
                result = num1 - num2;
                break;
            case '*':
                result = num1 * num2;
                break;
            case '/':
                result = num1 / num2;
                break;
        }
        num_top++;
        num_stack[num_top] = result;
    }

    return num_stack[num_top];
}
