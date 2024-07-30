import { css } from "@emotion/react";

export const dialogueBoxContainer = (width, height, customStyles) => css`
  border: 4px solid black;
  width: ${width};
  height: ${height};
  background: #f6f0f2;
  ${customStyles}
`;

export const dialogueBoxInnerContainer = (customStyles) => css`
  display: flex;
  width: 100%;
  justify-content: center;
  align-items: center;
  height: 100%;
  border-top: 4px solid #fff;
  border-right: 4px solid #fff;
  border-bottom: 4px solid #cac4ca;
  border-left: 4px solid #cac4ca;
  ${customStyles}
`;
