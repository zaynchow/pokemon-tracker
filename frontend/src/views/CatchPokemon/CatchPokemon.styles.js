import { css } from "@emotion/react";
export const catchPokemonContainer = css`
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
`;

export const catchPokemonDialogueBoxInner = css`
  flex-direction: column;
  justify-content: center;
  align-items: center;
  text-align: center;
  padding: 20px;
`;

export const pokemonImg = css`
  height: 70%;
`;

export const pokemonMetadata = css`
  margin: 20px;
  display: flex;
  width: 100%;
  justify-content: space-around;
  h2 {
    font-size: 32px;
  }
`;

export const pokemonNicknameContainer = css`
  display: flex;
  align-items: center;
  gap: 17px;
  input {
    width: 100%;
    height: 100%;
    border: 0;
    outline: 0;
    padding: 10px;
    font-family: "PKMN", sans-serif;
    font-size: 20px;
  }
`;

export const closeIcon = css`
  cursor: pointer;
  position: absolute;
  top: 5px;
  left: 5px;
  img {
    width: 50px;
  }
`;
