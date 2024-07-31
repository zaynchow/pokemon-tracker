/** @jsxImportSource @emotion/react */

import * as styles from "./PC.styles";
import closeIcon from "../../assets/img/CLOSE.png";
import { Link } from "react-router-dom";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import pokeBallImg from "../../assets/img/Pokeball_Color.png";
import ivysaurImg from "../../assets/img/Ivysaur.png";
import arrowIcon from "../../assets/img/ARROW.png";
import PCSlotIcon from "../../assets/img/PCSlot.png";
import { useState } from "react";
import { PCFilter } from "../PCFilter/PCFilter";
const PC = () => {
  const [showFilter, setShowFilter] = useState(false);

  return (
    <div>
      {showFilter && <PCFilter setShowFilter={setShowFilter} />}
      <div css={styles.header}>
        <Link to={"/trainer"}>
          <img src={closeIcon} alt="close" />
        </Link>
        <h1>PC</h1>
        <DialogueBox
          width={"198px"}
          height={"49px"}
          onClick={() => setShowFilter(true)}
          innerCustomCss={styles.filterDialogueBox}
        >
          <p>Filter</p>
        </DialogueBox>
      </div>
      <div css={styles.mainContent}>
        <div css={styles.pokemonSelection}>
          <DialogueBox
            width={"40%"}
            height={"100%"}
            innerCustomCss={styles.pokemonData}
          >
            <div css={styles.pokemonDataHeader}>
              <img src={pokeBallImg} alt={"pokeball"} />
              <h2>Pikachu</h2>
            </div>
            <div css={styles.pokemonDataMain}>
              <img src={ivysaurImg} alt="ivySaur" />
              <div css={styles.pokemonDataMainTextBox}>
                <h3>Level:</h3>
                <p>10</p>
              </div>
              <div css={styles.pokemonDataMainTextBox}>
                <h3>HP:</h3>
                <p>151/151</p>
              </div>
              <div css={styles.pokemonDataMainTable}>
                <div>
                  <h3>Nature</h3>
                </div>
                <div>
                  <p>151/151</p>
                  <p>151/151</p>
                </div>
              </div>

              <div css={styles.pokemonDataMainTable}>
                <div>
                  <h3>Moves</h3>
                </div>
                <div>
                  <p>Nuzzle</p>
                  <p>Nuzzle</p>
                  <p>Nuzzle</p>
                  <p>151/151</p>
                </div>
              </div>
            </div>
          </DialogueBox>
          <div css={styles.pokemonGrid}>
            <div css={styles.paginationContainer}>
              <img src={arrowIcon} alt="back arrow" />
              <DialogueBox innerCustomCss={styles.paginationNumber}>
                <p>Box 01/99</p>
              </DialogueBox>
              <img src={arrowIcon} alt="front arrow" />
            </div>
            <DialogueBox
              height={"100%"}
              width={"100%"}
              innerCustomCss={styles.pokemonSlots}
            >
              <div css={styles.singlePokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
            </DialogueBox>
          </div>
        </div>
        <div css={styles.rightSidebar}>
          <DialogueBox width={"100%"} innerCustomCss={styles.partyContainer}>
            <h3>PARTY</h3>
            <div css={styles.partyPokemonSlots}>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
              <div css={styles.singlePartyPokemonSlot}>
                <img src={PCSlotIcon} alt="PCSlot" />
                <img src={ivysaurImg} alt="ivySaur" />
              </div>
            </div>
          </DialogueBox>

          <DialogueBox innerCustomCss={styles.textBox}>
            <p>Add to Party</p>
          </DialogueBox>
          <DialogueBox innerCustomCss={styles.textBox}>
            <p>Release</p>
          </DialogueBox>
          <DialogueBox height={"100%"} innerCustomCss={styles.textBoxImg}>
            <img src={pokeBallImg} alt="pokeball" />
          </DialogueBox>
        </div>
      </div>
    </div>
  );
};

export default PC;
