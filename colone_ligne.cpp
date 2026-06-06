#include <stdio.h>

 main()
{
    int T[50][50];
    int sommeLigne[50];
    int sommeColonne[50];
    int L, C;
    int i, j;
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    printf("Entrer le nombre de lignes : ");
    scanf("%d", &L);
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    printf("Entrer le nombre de colonnes : ");
    scanf("%d", &C);
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    if (L > 50 || C > 50)
    {
        printf("Dimensions invalides !");
        return 0;
    }


    for(i = 0; i < L; i++)
        sommeLigne[i] = 0;

    for(j = 0; j < C; j++)
        sommeColonne[j] = 0;

    for(i = 0; i < L; i++)
    {
        for(j = 0; j < C; j++)
        {
            printf("T[%d][%d] = ", i, j);
            scanf("%d", &T[i][j]);

            sommeLigne[i] += T[i][j];
            sommeColonne[j] += T[i][j];
        }
    }


    printf("\n~Tableau~ :\n");

    for(i = 0; i < L; i++)
    {
        for(j = 0; j < C; j++)
        {
            printf("%d |\t", T[i][j]);
        }
        printf("\n");
    }


    printf("\n~Somme de chaque ligne~ :\n");

    for(i = 0; i < L; i++)
    {
        printf("~Ligne~ %d = %d\n", i+1, sommeLigne[i]);
    }


    printf("\n~Somme de chaque colonne~ :\n");

    for(j = 0; j < C; j++)
    {
        printf("~Colonne~ %d = %d\n", j+1, sommeColonne[j]);
    }


}

