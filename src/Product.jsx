export const Product = ({ title, price, inStock, categories }) => {
  return (
    <>
      <h3>{title}</h3>
      <p>Price: ${price}</p>
      <p>In stock: {inStock ? "Yes" : "No"}</p>
      <p>Categgories: {categories.join(", ")}</p>
    </>
  );
};
