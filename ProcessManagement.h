#ifndef PROCESSMANAGEMENT_H
#define PROCESSMANAGEMENT_H
#include <iostream>
#include "List.h"
#include "ProcessManagement.h"
class ProcessManagement{
 private:
    std::string processName;
    int priority;
    int nInstructions=0;
    List<std::string> processes;
public:
    std::string getElement();
    void addElement(std::string element);
    void addFront(std::string element);
    void setProcessName(std::string processName);
    void setPriority(int priority);
    std::string getProcessName();
    int getPriority();
    void updateNInstructions();
    int getNInstructions();
    void setNInstructions(int n);
};

#endif