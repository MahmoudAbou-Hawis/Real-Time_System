//*****************************************************************************
//
// io_fs.c - File System Processing for enet_io application.
//
// Copyright (c) 2007 Texas Instruments Incorporated.  All rights reserved.
// TI Information - Selective Disclosure
//
//*****************************************************************************
#include <stdbool.h>
#include <stdint.h>
#include <string.h>
#include "ti/devices/msp432e4/inc/msp.h"
#include "ti/devices/msp432e4/driverlib/driverlib.h"
#include "ustdlib.h"
#include "lwiplib.h"
#include "lwip/apps/httpd.h"
#include "lwip/apps/fs.h"
#include "third_party/lwip/src/apps/httpd/fsdata.h"
#include "io.h"

//*****************************************************************************
//
// Include the web file system data for this application.  This file is
// generated by the makefsfile utility, using the following command:
//
// ../../../../../tools/examples/makefsfile/makefsfile.exe -i fs -o io_fsdata.h -r -h -q
//
// If any changes are made to the static content of the web pages served by the
// application, this script must be used to regenerate io_fsdata.h in order
// for those changes to be picked up by the web server.
//
//*****************************************************************************
#include "io_fsdata.h"

//*****************************************************************************
//
// Open a file and return a handle to the file, if found.  Otherwise,
// return NULL.  This function also looks for special file names used to
// provide specific status information or to control various subsystems.
// These file names are used by the JavaScript on the "IO Control Demo 1"
// example web page.
//
//*****************************************************************************

err_t
fs_open(struct fs_file *psFile, const char *pcName)
{
    const struct fsdata_file *psTree;


    if ((psFile == NULL) || (pcName == NULL)) {
       return ERR_ARG;
    }
    //
    // Process request to toggle STATUS LED
    //
    if(ustrncmp(pcName, "/cgi-bin/toggle_led", 19) == 0)
    {
        static char pcBuf[4];

        //
        // Toggle the STATUS LED
        //
        io_set_led(!io_is_led_on());

        //
        // Get the new state of the LED
        //
        io_get_ledstate(pcBuf, 4);

        psFile->data = pcBuf;
        psFile->len = strlen(pcBuf);
        psFile->index = psFile->len;
        psFile->pextension = NULL;

        //
        // Return the psFile system pointer.
        //
        //return(psFile);
        return ERR_OK;
    }

    //
    // Request for LED State?
    //
    else if(ustrncmp(pcName, "/ledstate", 9) == 0)
    {
        static char pcBuf[4];

        //
        // Get the state of the LED
        //
        io_get_ledstate(pcBuf, 4);

        psFile->data = pcBuf;
        psFile->len = strlen(pcBuf);
        psFile->index = psFile->len;
        psFile->pextension = NULL;
        //return(psFile);
        return ERR_OK;
    }
    //
    // Request for the animation speed?
    //
    else if(ustrncmp(pcName, "/get_speed", 10) == 0)
    {
        static char pcBuf[6];

        //
        // Get the current animation speed as a string.
        //
        io_get_animation_speed_string(pcBuf, 6);

        psFile->data = pcBuf;
        psFile->len = strlen(pcBuf);
        psFile->index = psFile->len;
        psFile->pextension = NULL;
        //return(psFile);
        return ERR_OK;
    }
    //
    // Set the animation speed?
    //
    else if(ustrncmp(pcName, "/cgi-bin/set_speed?percent=", 12) == 0)
    {
        static char pcBuf[6];

        //
        // Extract the parameter and set the actual speed requested.
        //
        io_set_animation_speed_string((char*)pcName + 27);

        //
        // Get the current speed setting as a string to send back.
        //
        io_get_animation_speed_string(pcBuf, 6);

        psFile->data = pcBuf;
        psFile->len = strlen(pcBuf);
        psFile->index = psFile->len;
        psFile->pextension = NULL;
       // return(psFile);
        return ERR_OK;
    }
    //
    // If I can't find it there, look in the rest of the main psFile system
    //
    else
    {
        //
        // Initialize the psFile system tree pointer to the root of the linked
        // list.
        //
        psTree = FS_ROOT;

        //
        // Begin processing the linked list, looking for the requested file name.
        //
        while(NULL != psTree)
        {
            //
            // Compare the requested file "pcName" to the file name in the
            // current node.
            //
            if(ustrncmp(pcName, (char *)psTree->name, psTree->len) == 0)
            {
                //
                // Fill in the data pointer and length values from the
                // linked list node.
                //
                psFile->data = (char *)psTree->data;
                psFile->len = psTree->len;

                //
                // For now, we setup the read index to the end of the file,
                // indicating that all data has been read.
                //
                psFile->index = psTree->len;

                //
                // We are not using any file system extensions in this
                // application, so set the pointer to NULL.
                //
                psFile->pextension = NULL;

				psFile->flags = psTree -> flags;
                //
                // Exit the loop and return the file system pointer.
                //
                //break;
				return ERR_OK;
            }

            //
            // If we get here, we did not find the file at this node of the
            // linked list.  Get the next element in the list.
            //
            psTree = psTree->next;
        }
    }

    //
    // Return the file system pointer.
    //
    //return(psFile);
    return ERR_VAL;
}



//*****************************************************************************
//
// Close an opened file designated by the handle.
//
//*****************************************************************************
void
fs_close(struct fs_file *psFile)
{
    //
    // Free the main psFile system object.
    //
    mem_free(psFile);
}

//*****************************************************************************
//
// Read the next chunk of data from the file.  Return the iCount of data
// that was read.  Return 0 if no data is currently available.  Return
// a -1 if at the end of file.
//
//*****************************************************************************
int
fs_read(struct fs_file *psFile, char *pcBuffer, int iCount)
{
    int iAvailable;

    //
    // Check to see if a command (pextension = 1).
    //
    if(psFile->pextension == (void *)1)
    {
        //
        // Nothing to do for this file type.
        //
        psFile->pextension = NULL;
        return(-1);
    }

    //
    // Check to see if more data is available.
    //
    if(psFile->len == psFile->index)
    {
        //
        // There is no remaining data.  Return a -1 for EOF indication.
        //
        return(-1);
    }

    //
    // Determine how much data we can copy.  The minimum of the 'iCount'
    // parameter or the available data in the file system buffer.
    //
    iAvailable = psFile->len - psFile->index;
    if(iAvailable > iCount)
    {
        iAvailable = iCount;
    }

    //
    // Copy the data.
    //
    memcpy(pcBuffer, psFile->data + iAvailable, iAvailable);
    psFile->index += iAvailable;

    //
    // Return the count of data that we copied.
    //
    return(iAvailable);
}

//*****************************************************************************
//
// Determine the number of bytes left to read from the file.
//
//*****************************************************************************
int
fs_bytes_left(struct fs_file *psFile)
{
    //
    // Return the number of bytes left to be read from this file.
    //
    return(psFile->len - psFile->index);
}