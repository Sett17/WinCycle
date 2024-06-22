#include <windows.h>
#include "lib.h"

BOOL APIENTRY DllMain(HMODULE hModule,
                      DWORD  ul_reason_for_call,
                      LPVOID lpReserved) {
    switch (ul_reason_for_call) {
    case DLL_PROCESS_ATTACH:
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

void my_function() {
    MessageBox(NULL, "Hello from DLL!", "My Library", MB_OK);
}

#ifdef _DEV
int main() {
    my_function();
    return 0;
}
#endif
