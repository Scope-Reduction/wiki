Implementacja funkcjonalności, która musi zostać przetestowana pod kątem gameplayu składa się z dwóch etapów: implementacji prototypu oraz implementacji właściwej. Dzięki takiemu podziałowi możemy nie tracić czasu na pisanie jakościowego kodu, który jest do wyrzucenia, a zarazem zadbać o wysoką jakość kodu w projekcie.

Poprawny proces:
1. Tworzymy branch prototypowy, np. 67-prot-funny-number
2. Wykonujemy prototyp. Tutaj jakość kodu nie ma znaczenia, znaczenie ma szybkość jego tworzenia. Warto jednak zwrócić uwagę na parametryzację - ułatwi pkt. 3.
3. Oddajemy prototyp do review. Piszemy dokładnie gdzie znajduje się testowa scena oraz jak można dostosować parametry testowanego obiektu. Osoba odpowiedzialna za review testuje feel i stwierdza czy o to chodziło. Ewentualnie dostosowuje parametry i daje informację zwrotną czy jest okej, czy poprawiamy. Jeśli poprawiamy, wracamy do pkt. 2, jeśli nie to idziemy dalej.
4. Tworzymy branch właściwy, np. 67-funny-number i implementujemy na nim funkcjonalność, dbając o jakość kodu. Uwaga: tworzymy go od maina, nie od brancha prototypowego. Jest to *bardzo* ważne. Dzięki temu czas od powstania brancha do jego zmergeowania jest minimalny (mniejsze ryzyko konfliktów) oraz zmuszamy się do faktycznej reimplementacji (przemyślenie architektury itd.), a nie wprowadzania drobnych zmian.
5. Oddajemy branch właściwy do code review. Jeśli są uwagi poprawiamy i znowu oddajemy do skutku.
6. Mergeujemy branch do maina.