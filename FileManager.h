#ifndef FILEMANAGER_H
#define FILEMANAGER_H
#include <iostream>
#include "ProcessManagement.h"
#include <fstream>
#include "List.h"

using namespace std;
class FileManager{
 private:
    std::string fileName;
    List<ProcessManagement*> process;
    int nProcess=0;
public:
    FileManager(std::string fileName);
    void loadProcesses();
    List<ProcessManagement*> getProcess();
    void cleanList();
    int getNProcess();
    void setNProcess(int nprocess);
};

#endif
