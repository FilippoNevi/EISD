#ifndef FMUINTERFACE_MULTIPLIER_H
#define FMUINTERFACE_MULTIPLIER_H

#include <stdbool.h>
#include <stdint.h>

/* ---------------------------------------------------------------------------*
 * fmuTemplate.h
 * Definitions by the includer of this file
 * Copyright QTronic GmbH. All rights reserved.
 * ---------------------------------------------------------------------------*/

#include <stdio.h>
#include <string.h>
#include <assert.h>
#include <unistd.h>
#include <math.h>
#include "fmi2Functions.h"

#ifdef __cplusplus
extern "C" {
#endif

#define EPS_INDICATORS 1e-14

#define NUMBER_OF_REALS 4 // Adjust the number of variables
#define NUMBER_OF_INTEGERS 8 // Adjust the number of variables
#define NUMBER_OF_BOOLEANS 7 // Adjust the number of variables
#define NUMBER_OF_STRINGS  0
#define NUMBER_OF_STATES 0
#define NUMBER_OF_EVENT_INDICATORS 0



#define STATES {};
#define MODEL_IDENTIFIER controller_system
#define MODEL_GUID "{controller-a5cf1fbd-89ca-495b-b5ff-ec53a96c6173}"

// END MODEL STUFF


// macros used to define variables
#define  r(vr) comp->r[vr]
#define  integer(vr) comp->i[vr]
#define  b(vr) comp->b[vr]
#define  s(vr) comp->s[vr]
#define pos(z) comp->isPositive[z]
#define copy(vr, value) setString(comp, vr, value)



// categories of logging supported by model.
// Value is the index in logCategories of a ModelInstance.
#define LOG_ALL       0
#define LOG_ERROR     1
#define LOG_FMI_CALL  2
#define LOG_EVENT     3

#define NUMBER_OF_CATEGORIES 4

typedef enum {
    modelStartAndEnd        = 1<<0,
    modelInstantiated       = 1<<1,
    modelInitializationMode = 1<<2,

    // ME states
    modelEventMode          = 1<<3,
    modelContinuousTimeMode = 1<<4,
    // CS states
    modelStepComplete       = 1<<5,
    modelStepInProgress     = 1<<6,
    modelStepFailed         = 1<<7,
    modelStepCanceled       = 1<<8,
    modelTerminated         = 1<<9,
    modelError              = 1<<10,
    modelFatal              = 1<<11,
} ModelState;

typedef enum
{
    ACTIVE,
    INCREASE,
    NOTHING,
    DECREASE
} CSTATES;

typedef struct {

    fmi2Real    *r;
    fmi2Integer *i;
    fmi2Boolean *b;
    fmi2String  *s;
    fmi2Boolean *isPositive;

	fmi2Real time;
    char* instanceName;
    fmi2Type type;
    char* GUID;
    const fmi2CallbackFunctions *functions;
    fmi2Boolean loggingOn;
    fmi2Boolean logCategories[NUMBER_OF_CATEGORIES];

    fmi2ComponentEnvironment componentEnvironment;
    ModelState state;
    fmi2EventInfo eventInfo;
    int isDirtyValues; // !0 is true

    // Model variables:
    bool HIGH;
    bool LOW;
    bool OPEN;
    bool CLOSE;
    bool reset;
    double threshold;
	  // Add other model variables 
    bool Input_ready;
    bool Result_ready;
    uint8_t Result_1;
    uint8_t Result_2;
    uint8_t Result_3;
    uint8_t Result_4;
    uint8_t Input_1;
    uint8_t Input_2;
    uint8_t Input_3;
    uint8_t Input_4;

    CSTATES status;


} ModelInstance;

//Personal functions
//Suggestion: add here utility functions (i.e., conversion, bit masking, etc.)

// Returns a double variable as a 16-bit number
uint16_t return_fixed_threshold(double number);

// Returns four 8-bit variables that represent a 32-bit number as a double
double fixed_32_to_floating(uint8_t op1, uint8_t op2, uint8_t op3, uint8_t op4);

// Returns the 8-bit integer part of a number
uint8_t integer_part_mask(uint16_t number);

// Returns the 8-bit fractional part of a number
uint8_t fractional_part_mask(uint16_t number);

void controller_implementation( ModelInstance * comp );

// ---------------------------------------------------------------------------
// Functions from the fmuTemplace. but are them really need?
// ---------------------------------------------------------------------------

void setStartValues(ModelInstance *comp);

void calculateValues(ModelInstance *comp);


// ---------------------------------------------------------------------------
// Function calls allowed state masks for both Model-exchange and Co-simulation
// ---------------------------------------------------------------------------
#define MASK_fmi2GetTypesPlatform        (modelStartAndEnd | modelInstantiated | modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepInProgress | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)
#define MASK_fmi2GetVersion              MASK_fmi2GetTypesPlatform
#define MASK_fmi2SetDebugLogging         (modelInstantiated | modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepInProgress | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)
#define MASK_fmi2Instantiate             (modelStartAndEnd)
#define MASK_fmi2FreeInstance            (modelInstantiated | modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)
#define MASK_fmi2SetupExperiment         modelInstantiated
#define MASK_fmi2EnterInitializationMode modelInstantiated
#define MASK_fmi2ExitInitializationMode  modelInitializationMode
#define MASK_fmi2Terminate               (modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepFailed)
#define MASK_fmi2Reset                   MASK_fmi2FreeInstance
#define MASK_fmi2GetReal                 (modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)
#define MASK_fmi2GetInteger              MASK_fmi2GetReal
#define MASK_fmi2GetBoolean              MASK_fmi2GetReal
#define MASK_fmi2GetString               MASK_fmi2GetReal
#define MASK_fmi2SetReal                 (modelInstantiated | modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete)
#define MASK_fmi2SetInteger              (modelInstantiated | modelInitializationMode \
                                        | modelEventMode \
                                        | modelStepComplete)
#define MASK_fmi2SetBoolean              MASK_fmi2SetInteger
#define MASK_fmi2SetString               MASK_fmi2SetInteger
#define MASK_fmi2GetFMUstate             MASK_fmi2FreeInstance
#define MASK_fmi2SetFMUstate             MASK_fmi2FreeInstance
#define MASK_fmi2FreeFMUstate            MASK_fmi2FreeInstance
#define MASK_fmi2SerializedFMUstateSize  MASK_fmi2FreeInstance
#define MASK_fmi2SerializeFMUstate       MASK_fmi2FreeInstance
#define MASK_fmi2DeSerializeFMUstate     MASK_fmi2FreeInstance
#define MASK_fmi2GetDirectionalDerivative (modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelStepComplete | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)

// ---------------------------------------------------------------------------
// Function calls allowed state masks for Model-exchange
// ---------------------------------------------------------------------------
#define MASK_fmi2EnterEventMode          (modelEventMode | modelContinuousTimeMode)
#define MASK_fmi2NewDiscreteStates       modelEventMode
#define MASK_fmi2EnterContinuousTimeMode modelEventMode
#define MASK_fmi2CompletedIntegratorStep modelContinuousTimeMode
#define MASK_fmi2SetTime                 (modelEventMode | modelContinuousTimeMode)
#define MASK_fmi2SetContinuousStates     modelContinuousTimeMode
#define MASK_fmi2GetEventIndicators      (modelInitializationMode \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelTerminated | modelError)
#define MASK_fmi2GetContinuousStates     MASK_fmi2GetEventIndicators
#define MASK_fmi2GetDerivatives          (modelEventMode | modelContinuousTimeMode \
                                        | modelTerminated | modelError)
#define MASK_fmi2GetNominalsOfContinuousStates ( modelInstantiated \
                                        | modelEventMode | modelContinuousTimeMode \
                                        | modelTerminated | modelError)

// ---------------------------------------------------------------------------
// Function calls allowed state masks for Co-simulation
// ---------------------------------------------------------------------------
#define MASK_fmi2SetRealInputDerivatives (modelInstantiated | modelInitializationMode \
                                        | modelStepComplete)
#define MASK_fmi2GetRealOutputDerivatives (modelStepComplete | modelStepFailed | modelStepCanceled \
                                        | modelTerminated | modelError)
#define MASK_fmi2DoStep                  modelStepComplete
#define MASK_fmi2CancelStep              modelStepInProgress
#define MASK_fmi2GetStatus               (modelStepComplete | modelStepInProgress | modelStepFailed \
                                        | modelTerminated)
#define MASK_fmi2GetRealStatus           MASK_fmi2GetStatus
#define MASK_fmi2GetIntegerStatus        MASK_fmi2GetStatus
#define MASK_fmi2GetBooleanStatus        MASK_fmi2GetStatus
#define MASK_fmi2GetStringStatus         MASK_fmi2GetStatus

#ifdef __cplusplus
}
#endif


#endif
