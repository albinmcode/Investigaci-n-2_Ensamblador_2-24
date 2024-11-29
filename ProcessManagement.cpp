#include "ProcessManagement.h"
#include <List.h>

/**
 * @brief Agrega un elemento al final de la lista.
 * @param element Elemento a agregar.
 */
void ProcessManagement::addElement(std::string element){
    processes.append(element);
}

/**
 * @brief Agrega un elemento al inicio de la lista.
 * @param element Elemento a agregar.
 */
void ProcessManagement::addFront(std::string element){
    processes.insertFront(element);
}

/**
 * @brief Obtiene y elimina el primer elemento de la lista de procesos.
 * @return El primer elemento de la lista.
 */
std::string ProcessManagement::getElement(){
    return processes.popFront();
}


/**
 * @brief Establece el nombre del proceso.
 * @param processName Nombre del proceso.
 */
void ProcessManagement::setProcessName(std::string processName){
    this->processName=processName;
}

/**
 * @brief Establece la prioridad del proceso.
 * @param priority Valor de prioridad.
 */
void ProcessManagement::setPriority(int priority){
    this->priority=priority;
}
/**
 * @brief Obtiene el nombre del proceso.
 * @return Nombre del proceso.
 */
std::string ProcessManagement::getProcessName(){
    return processName;
}

/**
 * @brief Obtiene la prioridad del proceso.
 * @return Valor de prioridad del proceso.
 */
int ProcessManagement::getPriority(){
    return priority;
}

/**
 * @brief Incrementa el número de instrucciones del proceso en 1.
 */
void ProcessManagement::updateNInstructions(){
    nInstructions++;
}

/**
 * @brief Obtiene el número de instrucciones asociadas al proceso.
 * @return Número de instrucciones.
 */
int ProcessManagement::getNInstructions(){
    return nInstructions;
}

/**
 * @brief Decrementa el número de instrucciones del proceso en una cantidad específica.
 * @param n Cantidad a decrementar.
 */
void ProcessManagement::setNInstructions(int n){
    this->nInstructions-=n;
}
