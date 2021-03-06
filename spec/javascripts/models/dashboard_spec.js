describe("Dashboard Model", function() {

  beforeEach(function() {
    this.dashboard = new window.app.models.Dashboard();
  });

  it("can be created with default values", function() {
    expect(this.dashboard.get("name")).toEqual("Undefined name");
  });

  it("has default urlRoot", function() {
    expect(this.dashboard.urlRoot).toEqual("/api/dashboards");
  });
});
