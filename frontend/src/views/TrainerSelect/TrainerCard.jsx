/** @jsxImportSource @emotion/react */

import PokeballColor from "../../assets/img/Pokeball_Color.png";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import * as styles from "./TrainerCard.styles";
import { Link } from "react-router-dom";

const TrainerCard = () => {
  return (
    <DialogueBox
      outerCustomCss={styles.trainerCardContainer}
      width="875px"
      height={"168px"}
    >
      <Link to={"/trainer"}>
        <div css={styles.innerTrainerCardContainer}>
          <div css={styles.trainerInfo}>
            <img src={PokeballColor} alt="Pokeball" />
            <div css={styles.trainerInfoRight}>
              <p css={styles.trainerName}>ASH</p>
              <div css={styles.trainerMetadata}>
                <p>Kanto</p>
                <p>Pokedex: 101/151</p>
              </div>
            </div>
          </div>
        </div>
      </Link>
    </DialogueBox>
  );
};

export default TrainerCard;
