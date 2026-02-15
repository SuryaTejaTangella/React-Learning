export const ContactForm = () => {
    return (
        <form>
            <label htmlFor="name">Name:</label>
            <input type="text" id="name" name="name" />
            <br />
            <label htmlFor="email">Email:</label>
            <input type="email" id="email" name="email" />
            <br />
        </form>
    )
    ;
}
