import { css } from "@emotion/react";

export const trainerProfileContainer = css`
  width: 100%;
  height: 100vh;
  display: flex;

  justify-content: center;
  align-items: center;
`;

export const innerContainer = css`
  padding: 20px;
`;

export const achievements = css`
  padding: 2px 10px;
`;

export const mainContent = css`
  width: 100%;
  flex-direction: column;
`;

export const trainerData = css`
  display: flex;
  width: 100%;
  gap: 80px;
  justify-content: center;
  h1,
  h2 {
    font-size: 36px;
  }
  > div {
    position: relative;
    margin-top: 40px;
  }
`;
export const trainerMetadata = css`
  p,
  h3 {
    font-size: 22px;
  }
  display: flex;
  width: 100%;
  justify-content: space-between;
`;

export const leftColumn = css`
  h1 {
    margin-bottom: 60px;
  }
  > div {
    display: flex;
    flex-direction: column;
    gap: 20px;
  }
`;

export const rightColumn = css`
  display: flex;
  flex-direction: column;
  * {
    display: block;
    margin: 0 auto;
    width: max-content;
  }
`;

export const upperContent = css`
  padding: 40px;
  width: 100%;
  height: 100%;
  display: flex;
  align-items: flex-end;
  justify-content: center;
  flex-direction: column;
`;

export const badgesContainer = css`
  width: 100%;
  justify-content: center;
  align-items: center;
  display: flex;
  gap: 20px;
  background-color: #e5dde0;
  margin: 20px 0px 30px 0;
  padding: 15px 0;
  img {
    height: 90%;
  }
`;

export const closeIcon = css`
  position: absolute;
  top: 5px;
  left: 5px;
  height: 76px;
`;
