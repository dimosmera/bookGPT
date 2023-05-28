export interface State {
  answer: string;
  question: string;
}

export const initialState: State = {
  question: "What is this story about?",
  answer: "",
};

export enum ActionTypes {
  SET_QUESTION = "SET_QUESTION",
  SET_ANSWER = "SET_ANSWER",
}

export type Action =
  | {
      type: ActionTypes.SET_QUESTION;
      question: string;
    }
  | {
      type: ActionTypes.SET_ANSWER;
      answer: string;
    };

export type Dispatch = (action: Action) => void;

export const reducer = (state: State, action: Action): State => {
  switch (action.type) {
    case ActionTypes.SET_QUESTION:
      return {
        ...state,
        question: action.question,
      };
    case ActionTypes.SET_ANSWER:
      return {
        ...state,
        answer: action.answer,
      };

    default:
      return state;
  }
};
