/** @jsxImportSource @emotion/react */
import badge3Icon from "../../assets/img/badge3.png";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import * as styles from "./TrainerProfile.styles";
import trainerImg from "../../assets/img/Trainer.png";
import closeIcon from "../../assets/img/CLOSE.png";
import { Link } from "react-router-dom";

const TrainerProfile = () => {
  return (
    <div css={styles.trainerProfileContainer}>
      <DialogueBox
        width={"75vw"}
        height={"95vh"}
        innerCustomCss={styles.innerContainer}
      >
        <DialogueBox
          width={"100%"}
          height={"100%"}
          innerCustomCss={styles.mainContent}
        >
          <div css={styles.upperContent}>
            <div>
              <DialogueBox innerCustomCss={styles.achievements}>
                <p>Achievements</p>
              </DialogueBox>
            </div>
            <div css={styles.trainerData}>
              <div css={styles.leftColumn}>
                <h1>Trainer Card</h1>
                <div>
                  <div css={styles.trainerMetadata}>
                    <h3>Name:</h3>
                    <p>Ash</p>
                  </div>
                  <div css={styles.trainerMetadata}>
                    <h3>Name:</h3>
                    <p>Ash</p>
                  </div>
                  <div css={styles.trainerMetadata}>
                    <h3>Name:</h3>
                    <p>Ash</p>
                  </div>
                  <div css={styles.trainerMetadata}>
                    <h3>Name:</h3>
                    <p>Ash</p>
                  </div>
                </div>
              </div>

              <div css={styles.rightColumn}>
                <h2>ID: 12345</h2>
                <img src={trainerImg} alt="trainer" height="100%" />
              </div>
            </div>
          </div>
          <div css={styles.badgesContainer}>
            <img src={badge3Icon} alt="badge" />
            <img src={badge3Icon} alt="badge" />
            <img src={badge3Icon} alt="badge" />
            <img src={badge3Icon} alt="badge" />
          </div>
          <Link to={"/trainer"} css={styles.closeIcon}>
            <img src={closeIcon} alt="closeIcon" />
          </Link>
        </DialogueBox>
      </DialogueBox>
    </div>
  );
};

export default TrainerProfile;
