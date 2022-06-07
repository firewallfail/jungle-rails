describe("test home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Loads a product page", () => {
    cy.get('[alt="Scented Blade"]').click();
    cy.contains("Scented Blade");
  });


})