/** @jsxImportSource @emotion/react */

import React from "react";
import * as styles from "./DialogueBox.styles";

const DialogueBox = ({
  width,
  height,
  children,
  outerCustomCss,
  innerCustomCss,
  onClick,
}) => {
  return (
    <div
      css={styles.dialogueBoxContainer(width, height, outerCustomCss)}
      onClick={onClick}
    >
      <div css={styles.dialogueBoxInnerContainer(innerCustomCss)}>
        {children}
      </div>
    </div>
  );
};

export default DialogueBox;
