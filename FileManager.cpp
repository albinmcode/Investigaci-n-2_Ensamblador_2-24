#include "FileManager.h"

/**
 * @brief Constructor de la clase FileManager.
 * @param fileName Nombre del archivo que se desea manejar.
 */
FileManager::FileManager(std::string fileName) : fileName(fileName) {}


/**
 * @brief Realiza split a una cadena.
 * @param juego Cadena que se desea separar.
 * @param delimitador Delimitador utilizado para dividir la cadena.
 * @param n Número máximo de subcadenas que se espera.
 * @return Un puntero a un arreglo dinámico de cadenas con las subcadenas separadas.
 */
string* separarPalabras(string juego, string delimitador,int n){
    int indiceInicio=0;
    int buscar=juego.find(delimitador);
    int i=0;
    string* separacion=new string[n];

    while(buscar!=-1){
        string token=juego.substr(indiceInicio,buscar);
        separacion[i++]=token;
        juego=juego.substr(buscar+delimitador.length());
        buscar=juego.find(delimitador);
        if(buscar==-1){
            token=juego;
            separacion[i++]=token;
        }
    }
    return separacion;
}

/**
 * @brief Carga los procesos desde un archivo y los almacena en una lista.
 */
void FileManager::loadProcesses() {
    std::ifstream file(fileName);
    if (!file.is_open()) {
        std::cerr << "Error: No se pudo abrir el archivo " << fileName << std::endl;
        return;
    }
    int n=0;
    std::string line;
    ProcessManagement *processLine=new ProcessManagement();
    while (getline(file, line)) {
        std::string patron = " ";
        int fin = line.find(patron);

        // Verificar si se encontró el patrón
        if (fin != -1) {
            std::string parse = line.substr(0,fin);
            if(parse=="proceso"){
                if(n!=0){
                    process.append(processLine);
                    nProcess++;
                    processLine=new ProcessManagement();
                    
                }
                string* separar=separarPalabras(line," ",3);
                processLine->setProcessName(separar[1]);
                processLine->setPriority(stoi(separar[2]));
                n++;
                delete[] separar;
            }
        } 
        
        if(line!="fin proceso"){
            processLine->addElement(line);
            processLine->updateNInstructions();
        }
    }
                    process.append(processLine);
                    nProcess++;

    

    std::cout << "Lectura completa." << std::endl;
}

/**
 * @brief Limpia la primer instruccion de la lista de procesos.
 */
void FileManager::cleanList(){
    for(int i=0;i<nProcess;i++){
        ProcessManagement *process1=process.popFront();
        process1->getElement();
        process1->setNInstructions(1);
        process.append(process1);
    }
}

/**
 * @brief Obtiene la lista de procesos cargados.
 * @return Lista de procesos.
 */
List<ProcessManagement*> FileManager::getProcess(){
    return process;
}


/**
 * @brief Obtiene el número de procesos cargados.
 * @return Número de procesos.
 */
int FileManager::getNProcess(){
    return nProcess;
}

/**
 * @brief Setea el numero de procesos.
 * @param nproces Número de procesos.
 */
void::FileManager::setNProcess(int nproces){
    this->nProcess=nproces;
}
