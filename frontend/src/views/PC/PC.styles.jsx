import { css } from "@emotion/react";

export const header = css`
  background-color: #cea1d1;
  height: 10vh;
  position: relative;
  box-sizing: border-box;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 5px;
  h1 {
    color: white;
  }
  a {
    height: 100%;
    img {
      height: 100%;
    }
  }
`;
export const mainContent = css`
  padding: 30px;
  overflow: hidden;
  height: 90vh;
  display: flex;
  width: 100%;
  gap: 40px;
  position: relative;
`;

export const pokemonSelection = css`
  display: flex;
  align-items: center;
  width: 80%;
  height: 100%;
  position: relative;
`;

export const pokemonData = css`
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  height: 100%;
  overflow-y: scroll;
  overflow-x: hidden;
`;

export const pokemonDataHeader = css`
  background-color: #cea1d1;
  height: 72px;
  width: 100%;
  padding: 3px 7px;
  display: flex;
  align-items: center;
  gap: 14px;
  img {
    height: 100%;
  }
  h2 {
    font-size: 30px;
  }
`;

export const pokemonDataMain = css`
  width: 100%;
  padding: 18px;

  img {
    height: 280px;
    display: block;
    margin: 0 auto;
  }
  h3,
  p {
    font-size: 24px;
  }
`;

export const pokemonDataMainTextBox = css`
  background: #d1c6d0;
  padding: 11px;
  margin-bottom: 10px;
  h3 {
    margin-right: 5px;
  }
`;

export const pokemonDataMainTable = css`
  border: 2px solid black;
  margin-bottom: 10px;
  background-color: #d1c6d0;
  div:nth-child(1) {
    background-color: #cea1d1;
    padding: 10px 0;
    border-bottom: 2px solid black;
  }

  div {
    display: flex;
    align-items: center;
    justify-content: center;
    flex-direction: column;
    p {
      margin: 7px 0;
    }
  }
`;

export const pokemonGrid = css`
  display: flex;
  height: 100%;
  gap: 20px;
  width: 100%;
  flex-direction: column;
  align-items: center;
`;

export const paginationNumber = css`
  background: white;
  padding: 0px 10px;
  p {
    font-size: 24px;
  }
`;
export const paginationContainer = css`
  display: flex;
  height: 70px;

  img:nth-child(1) {
    transform: rotate(180deg);
  }
  img {
    cursor: pointer;
  }
`;

export const pokemonSlots = css`
  align-items: flex-start;
  flex-wrap: wrap;
  align-content: flex-start;
  justify-content: space-between;
  position: relative;
  row-gap: 20px;
  padding: 10px;
`;

export const singlePokemonSlot = css`
  width: calc(25% - 10px);
  display: flex;
  justify-content: center;
  img:nth-child(1) {
    position: relative;
    width: 100%;
    height: 100%;
  }
  img:nth-child(2) {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
  }
`;

export const rightSidebar = css`
  position: relative;
  display: flex;
  flex-direction: column;
  gap: 10px;
  height: 100%;
  width: 20%;
`;

export const partyContainer = css`
  justify-content: flex-start;
  flex-direction: column;
  padding: 10px;
  height: 100%;
  > h3 {
    margin-bottom: 10px;
    font-size: 24px;
  }
`;
export const singlePartyPokemonSlot = css`
  width: calc(30%);

  img:nth-child(1) {
    position: relative;
    width: 100%;
  }
  img:nth-child(2) {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
  }
`;
export const partyPokemonSlots = css`
  width: 100%;
  display: flex;
  flex-wrap: wrap;

  justify-content: space-between;
`;
export const textBox = css`
  padding: 14px;
  width: 100%;
  position: relative;
  p {
    font-size: 100%;
  }
`;

export const textBoxImg = css`
  position: relative;
  height: 100%;
  img {
    position: relative;
    height: 100%;
  }
`;


export const filterDialogueBox = css`
  cursor: pointer;
`;