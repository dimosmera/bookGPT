export interface State {
  answer: string;
  question: string;
  loading: boolean;
}

export const initialState: State = {
  question: "What is this story about?",
  answer: "",
  loading: false,
};

export enum ActionTypes {
  SET_QUESTION = "SET_QUESTION",
  SET_ANSWER = "SET_ANSWER",
  SET_LOADING = "SET_LOADING",
}

export type Action =
  | {
      type: ActionTypes.SET_QUESTION;
      question: string;
    }
  | {
      type: ActionTypes.SET_ANSWER;
      answer: string;
    }
  | {
      type: ActionTypes.SET_LOADING;
      loading: boolean;
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
        loading: false,
      };
    case ActionTypes.SET_LOADING:
      return {
        ...state,
        loading: action.loading,
      };

    default:
      return state;
  }
};
