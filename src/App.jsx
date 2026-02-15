import "./App.css";
import { Welcome } from "./Welcome";
import { Button } from "./Button";
import { Hello, HelloWithoutJSX } from "./Hello";
import { UserProfile } from "./UserProfile";

function App() {
  return (
    <div>
      <UserProfile />
      <Hello />
      <HelloWithoutJSX />
      <Welcome />
      <Button />
    </div>
  );
}

export default App;
