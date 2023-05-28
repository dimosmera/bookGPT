import React, { createContext, useContext, useReducer } from "react";

import { Action, State, reducer, initialState } from "./reducer";

interface IContext {
  state: State;
  dispatch: React.Dispatch<Action>;
}

const StateContext = createContext<IContext>({
  state: initialState,
  dispatch: () => {},
});

interface Props {
  children: React.ReactElement;
}

const StateProvider = ({ children }: Props) => {
  const [state, dispatch] = useReducer(reducer, initialState);

  return (
    <StateContext.Provider value={{ state, dispatch }}>
      {children}
    </StateContext.Provider>
  );
};

/**
 * Use this function to get/set state
 */
export const useUserState = () => {
  const { state, dispatch } = useContext(StateContext);
  return { state, dispatch };
};

export default StateProvider;
