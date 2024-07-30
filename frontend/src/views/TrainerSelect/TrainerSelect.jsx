/** @jsxImportSource @emotion/react */


import * as styles from "./TrainerSelect.styles";
import TrainerCard from "./TrainerCard";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import { Link } from "react-router-dom";

const TrainerSelect = () => {
  return (
    <div css={styles.trainerSelectContainer}>
      <h1>CHOOSE A TRAINER</h1>
      <div css={styles.trainerCard}>
        <TrainerCard />
        <TrainerCard />
        <TrainerCard />
        <TrainerCard />
      </div>
      <Link to={"/catch-pokemon"}>
        <DialogueBox
          width="875px"
          height={"168px"}
          outerCustomCss={styles.newTrainerDialogueBox}
        >
          <h2>NEW TRAINER...</h2>
        </DialogueBox>
      </Link>
      <DialogueBox
        width={55}
        height={150}
        outerCustomCss={styles.adminDialogueBox}
      >
        <h3 css={styles.adminDialogueBoxText}>Admin</h3>
      </DialogueBox>
    </div>
  );
};

export default TrainerSelect;
