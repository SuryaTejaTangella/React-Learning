export const CandidateProfile = () => {
  const name = "Peter Parker";
  const role = "Web Developer";
  const yearsOfExperience = 5;
  const isAvailable = true;

  return (
    <>
      <h2>{name}</h2>
      <p>
        {role} with {yearsOfExperience} years of experience
      </p>
      <p>Started in {2026 - yearsOfExperience}</p>
      <p>Status: {isAvailable ? "Available for Hire" : "Not Available"}</p>
      <p>Contact: {name.toLowerCase().replace(" ", ".")}@email.com</p>
    </>
  );
};
