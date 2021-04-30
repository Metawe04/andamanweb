const yaml = require("js-yaml")
const fs = require("fs")
const path = require("path")

// Get document, or throw exception on error
try {
  const doc = yaml.safeLoad(fs.readFileSync(path.resolve(__dirname, "frontend/web/uploads/icons.yml"), "utf8"))
  const icons = []
  Object.keys(doc).map((i) => {
    if (doc[i].styles.includes("solid")) {
      icons.push({ name: "fas fa-" + i })
    }
    if (doc[i].styles.includes("brands")) {
      icons.push({ name: "fab fa-" + i })
    }
    if (doc[i].styles.includes("regular")) {
      icons.push({ name: "far fa-" + i })
    }
  })
  fs.writeFile("icons.json", JSON.stringify(icons), function(err) {
    if (err) throw err
    console.log("complete")
  })
} catch (e) {
  console.log(e)
}
