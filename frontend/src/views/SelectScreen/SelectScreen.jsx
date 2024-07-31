/** @jsxImportSource @emotion/react */

import * as styles from "./SelectScreen.styles";
import SingleSelect from "./SingleSelect";
import avatar from "../../assets/img/Avatar.png";

const SelectScreen = () => {
  return (
    <div css={styles.selectScreenContainer}>
      <SingleSelect title={"PC"} linkTo={"/PC"} imgSrc={avatar} />
      <SingleSelect title={"Pokedex"} linkTo={"/Pokedex"} imgSrc={avatar} />
      <SingleSelect
        title={"Profile"}
        linkTo={"/trainer-profile"}
        imgSrc={avatar}
      />
      <SingleSelect title={"Trainer Select"} linkTo={"/"} imgSrc={avatar} />
    </div>
  );
};

export default SelectScreen;
