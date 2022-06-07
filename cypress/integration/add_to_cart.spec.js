describe("test home page", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("Adds item to cart", () => {
    cy.contains('Add').first().click({ force: true });
    cy.contains(' My Cart (1) ');
  });

})