/** @jsxImportSource @emotion/react */

import DialogueBox from "../../components/DialogueBox/DialogueBox";
import * as styles from "./CatchPokemon.styles";
import arbokImg from "../../assets/img/Arbok.png";
import closeIcon from "../../assets/img/CLOSE.png";
import { Link } from "react-router-dom";

const CatchPokemon = () => {
  return (
    <div css={styles.catchPokemonContainer}>
      <DialogueBox
        width={"70vw"}
        height={"90vh"}
        innerCustomCss={styles.catchPokemonDialogueBoxInner}
      >
        <img src={arbokImg} alt="arbok" css={styles.pokemonImg} />
        <h1>Gotcha! ARBOK was caught!</h1>
        <div css={styles.pokemonMetadata}>
          <h2>Lv: 50</h2>
          <h2>Nature: Jolly</h2>
        </div>
        <div css={styles.pokemonNicknameContainer}>
          <p>Name of Pokemon: </p>
          <DialogueBox width={"354px"} height={"57px"}>
            <input type="text" placeholder="Nickname..." />
          </DialogueBox>
        </div>
        <Link to={"/"} css={styles.closeIcon}>
          <img src={closeIcon} alt="close" />
        </Link>
      </DialogueBox>
    </div>
  );
};

export default CatchPokemon;
