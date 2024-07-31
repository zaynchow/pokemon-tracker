/** @jsxImportSource @emotion/react */
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import * as styles from "./PCFilter.styles";
import closeIcon from "../../assets/img/CLOSE.png";

export const PCFilter = ({ setShowFilter }) => {
  return (
    <div css={styles.pcFilterContainer}>
      <DialogueBox
        width={"75vw"}
        height={"95vh"}
        innerCustomCss={styles.mainContent}
      >
        <img
          src={closeIcon}
          alt="closeIcon"
          onClick={() => setShowFilter(false)}
        />
        <div css={styles.filterContent}>
          <h1>Filter</h1>
          <div css={styles.filterRow}>
            <div>
              <h2>Type: </h2>
            </div>
            <div css={styles.inputCol}>
              <DialogueBox width={"170px"} height={"57px"}>
                <select name="pets" id="pet-select">
                  <option value="">Type 1</option>
                  <option value="dog">Dog</option>
                  <option value="cat">Cat</option>
                  <option value="hamster">Hamster</option>
                  <option value="parrot">Parrot</option>
                </select>
              </DialogueBox>
              <DialogueBox width={"170px"} height={"57px"}>
                <select name="pets" id="pet-select">
                  <option value="">Type 2</option>
                  <option value="dog">Dog</option>
                  <option value="cat">Cat</option>
                  <option value="hamster">Hamster</option>
                </select>
              </DialogueBox>
            </div>
          </div>
          <div css={styles.filterRow}>
            <div>
              <h2>Level:</h2>
            </div>
            <div css={styles.inputCol}>
              <DialogueBox width={"160px"} height={"67px"}>
                <input type={"number"} placeholder="Min..." />
              </DialogueBox>
              <DialogueBox width={"160px"} height={"67px"}>
                <input type={"number"} placeholder="Max..." />
              </DialogueBox>
            </div>
          </div>
          <div css={styles.filterRow}>
            <div>
              <h2>Species:</h2>
            </div>
            <div css={styles.inputCol}>
              <DialogueBox width={"160px"} height={"67px"}>
                <input type={"number"} placeholder="ID" />
              </DialogueBox>
            </div>
          </div>
          <div css={styles.filterRow}>
            <div>
              <h2>Effective Against:</h2>
            </div>
            <div css={styles.inputCol}>
              <DialogueBox width={"170px"} height={"57px"}>
                <select name="pets" id="pet-select">
                  <option value="">Type 1</option>
                  <option value="dog">Dog</option>
                  <option value="cat">Cat</option>
                  <option value="hamster">Hamster</option>
                  <option value="parrot">Parrot</option>
                </select>
              </DialogueBox>
            </div>
          </div>
          <DialogueBox
            innerCustomCss={styles.showResultsContainer}
            onClick={() => setShowFilter(false)}
          >
            <p>Show Results</p>
          </DialogueBox>
        </div>
      </DialogueBox>
    </div>
  );
};
