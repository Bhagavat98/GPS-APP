import React from "react";
import { AppRegistry } from "react-native";
import { Provider } from "react-redux";
import { createStore, applyMiddleware } from "redux";

import AppReducer from "./src/reducers";
import { AppNavigator, middleware } from "./src/navigations/AppNavigation";

const store = createStore(AppReducer, applyMiddleware(middleware));

console.disableYellowBox = true;

class StarterApp extends React.Component {
  render() {
    return (
      <Provider store={store}>
        <AppNavigator />
      </Provider>
    );
  }
}

AppRegistry.registerComponent("StarterApp", () => StarterApp);

export default StarterApp;

01-Aug-2022 - 35925.0
02-Sep-2022 - 49598.00
04-Oct-2022 - 49598.00
01-Nov-2022 - 49597.00
01-Dec-2022 - 51337.00
30-Dec-2022 - 51325.00
01-Feb-2023 - 45859.00
01-Mar-2023 - 51237.00
31-Mar-2023 - 51337.00
01-May-2023 - 51337.00
01-Jun-2023 - 51337.00
01-Jul-2023 - 51325.00
