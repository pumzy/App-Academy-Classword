export const RECEIVE_STEPS = "RECEIVE_STEPS";
export const RECEIVE_STEP = "RECEIVE_STEP";
export const REMOVE_STEP = "REMOVE_STEP";

export const receiveSteps = function(steps){
  return ({
    type: RECEIVE_STEPS,
    steps: steps
  });
};

export const receiveStep = function(step){
  return ({
    type: RECEIVE_STEP,
    step: step
  });
};

export const removeStep = function(step){
  return ({
    type: REMOVE_STEP,
    step: step
  });
};

window.receiveSteps = receiveSteps;
window.receiveStep = receiveStep;
window.removeStep = removeStep;
