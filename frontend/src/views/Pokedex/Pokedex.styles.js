import { css } from "@emotion/react";

export const header = css`
  background-color: #cea1d1;
  height: 10vh;
  color: white;
  display: flex;
  align-items: center;
  justify-content: center;

  a {
    position: absolute;
    top: 0;
    left: 5px;
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
`;

export const pokemonInfo = css`
  display: flex;
  height: 100%;
  width: 50%;
  flex-direction: column;
  align-items: center;
`;

export const pokemonMetadataContainer = css`
  padding: 20px;
  gap: 20px;
  align-items: flex-start;
  flex-direction: column;
`;

export const pokemonType = css`
  * {
    font-size: 20px;
  }
  p {
    background-color: #9ce183;
    padding: 4px 5px;
    margin-right: 5px;
  }
  h3 {
    margin-right: 10px;
  }
`;

export const pokemonMetadata = css`
  * {
    font-size: 20px;
  }
  h3 {
    margin-right: 10px;
  }
`;

export const listContainer = css`
  padding-top: 40px;
  height: 100%;
  overflow-y: scroll;
  display: flex;
  flex-direction: column;
  gap: 20px;
`;

export const listItem = css`
  display: flex;
  align-items: center;
  gap: 50px;
  * {
    font-size: 20px;
  }
  > div {
    display: flex;
    align-items: center;
    gap: 10px;
  }
`;
