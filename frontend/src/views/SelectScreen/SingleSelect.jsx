/** @jsxImportSource @emotion/react */

import React from "react";
import { Link } from "react-router-dom";
import DialogueBox from "../../components/DialogueBox/DialogueBox";
import * as styles from "./SingleSelect.styles";

const SingleSelect = ({ title, imgSrc, linkTo }) => {
  return (
    <Link to={linkTo}>
      <DialogueBox
        width={"588.5px"}
        height={"292px"}
        outerCustomCss={styles.singleSelectOuterContainer}
        innerCustomCss={styles.singleSelectInnerContainer}
      >
        <img src={imgSrc} alt={"selectImg"} />
        <h2 css={styles.title}>{title}</h2>
      </DialogueBox>
    </Link>
  );
};

export default SingleSelect;
