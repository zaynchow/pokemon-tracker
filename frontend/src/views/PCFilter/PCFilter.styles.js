import { css } from "@emotion/react";

export const pcFilterContainer = css`
  position: absolute;
  z-index: 2;
  background-color: rgb(0 0 0 / 30%);
  backdrop-filter: blur(10px);
  height: 100vh;
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
`;

export const mainContent = css`
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  img {
    position: absolute;
    top: 5px;
    left: 5px;
    height: 70px;
    cursor: pointer;
  }
`;

export const filterContent = css`
  padding: 40px;
  margin-left: 80px;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: flex-start;
  gap: 30px;
  h1 {
    margin-bottom: 30px;
  }
`;
export const filterRow = css`
  display: flex;
  align-items: center;
  gap: 80px;
  h2 {
    font-size: 26px;
  }
`;
export const checkboxInput = css`
  display: flex;
  align-items: center;
  gap: 10px;

  input {
    height: 40px;
    width: 40px;
  }
`;

export const inputCol = css`
display: flex;
gap:20px;
select {

 font-family: 'PKMN', sans-serif;
  border: 0;
  outline: none;
  width: 100%;
  height: 100%;
  background: transparent;
  option {
    font-family:   font-family: 'PKMN', sans-serif;
  }
}

input {
    font-family: "PKMN", sans-serif;
    border: 0;
    outline: none;
    width: 100%;
    height: 100%;
    background: white;
  }
`;

export const showResultsContainer = css`
  padding: 10px 17px;
  cursor: pointer;
  p {
    font-size: 16px;
  }
`;
