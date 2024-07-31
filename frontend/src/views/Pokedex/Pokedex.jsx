/** @jsxImportSource @emotion/react */

import * as styles from "./Pokedex.styles";
import closeIcon from "../../assets/img/CLOSE.png";
import { Link } from "react-router-dom";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import ivysaurImg from "../../assets/img/Ivysaur.png";
import pokeballColorIcon from "../../assets/img/Pokeball_Color.png";

const ListItem = () => {
  return (
    <div css={styles.listItem}>
      <div>
        <img src={pokeballColorIcon} alt="pokeball-color" width={"51px"} />
        <p>001</p>
      </div>
      <h4>Bulbasaur</h4>
    </div>
  );
};

const Pokedex = () => {
  return (
    <div>
      <div css={styles.header}>
        <h1>Pokedex</h1>
        <Link to={"/trainer"}>
          <img src={closeIcon} alt="close" />
        </Link>
      </div>
      <div css={styles.mainContent}>
        <div css={styles.pokemonInfo}>
          <DialogueBox width={"100%"} height={"75px"}>
            <h2>Ivysaur</h2>
          </DialogueBox>
          <img src={ivysaurImg} height={"700px"} alt={"ivysaur"} />
          <DialogueBox
            width={"100%"}
            innerCustomCss={styles.pokemonMetadataContainer}
          >
            <div css={styles.pokemonType}>
              <h3>Type:</h3>
              <p>Grass</p>
              <p>Poison</p>
            </div>
            <h4>
              A strange seed was planted on its back at birth. The plant sprouts
              and grows with this Pokemon.
            </h4>
            <div css={styles.pokemonMetadata}>
              <h3>Encounter Date:</h3>
              <p>2024/07/26</p>
            </div>
            <div css={styles.pokemonMetadata}>
              <h3>Evolves From:</h3>
              <p>Bulbasaur</p>
            </div>
            <div css={styles.pokemonMetadata}>
              <h3>Number Caught:</h3>
              <p>10</p>
            </div>
          </DialogueBox>
        </div>
        <DialogueBox
          width={"50%"}
          height={"100%"}
          innerCustomCss={styles.listContainer}
        >
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
          <ListItem />
        </DialogueBox>
      </div>
    </div>
  );
};

export default Pokedex;
