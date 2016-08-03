var assert = require("assert"); // node.js core module
var PiarX4 = require("./PiarX4");

describe("giftcard numbering test", function () {
    this.timeout(25000);

    it("should be able to login",  function (done) {
        return PiarX4.login(this.browser, done);
    });

    it.skip("issue #65: giftcard numbering should add properly", function(done) {
        return this.browser.get(PiarX4.url("/index.php/giftcards")).elementByCssSelector(".modal-dlg").click()
            .elementByName("value", 10000).type("100").elementById('giftcard_number').clear().type("10")
            .elementById("submit").click().elementByXPath("//table/tbody/tr[td/text()='10']", 2000).text().then(function (value) {
                assert.ok(value, "giftcard failed to be added properly!");
            }).elementByCssSelector(".modal-dlg").click().elementByName("value", 4000).type("100").elementById("submit").click()
            .elementByXPath("//table/tbody/tr[td/text()='11']").text().then(function (value) {
                assert.equal(value, "11", "giftcard number not incrementing properly!!");
            }).then(done, done);
    });

});
