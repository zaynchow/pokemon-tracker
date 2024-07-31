import CatchPokemon from "./views/CatchPokemon/CatchPokemon";
import PC from "./views/PC/PC";
import { PCFilter } from "./views/PCFilter/PCFilter";
import Pokedex from "./views/Pokedex/Pokedex";
import SelectScreen from "./views/SelectScreen/SelectScreen";
import TrainerProfile from "./views/TrainerProfile/TrainerProfile";
import TrainerSelect from "./views/TrainerSelect/TrainerSelect";
import { Route, BrowserRouter, Routes } from "react-router-dom";

function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<TrainerSelect />} />
        <Route path="/trainer" element={<SelectScreen />} />
        <Route path="/catch-pokemon" element={<CatchPokemon />} />
        <Route path="/pokedex" element={<Pokedex />} />
        <Route path="/pc" element={<PC />} />
        <Route path="/trainer-profile" element={<TrainerProfile />} />
        <Route path="/filter" element={<PCFilter />} />
      </Routes>
    </BrowserRouter>
  );
}

export default App;
