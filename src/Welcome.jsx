export const Welcome = (props) => {
  console.log(props);
  return (
    <h2>
      Welcome, {props.name} a.k.a {props.alias}!
    </h2>
  );
};
