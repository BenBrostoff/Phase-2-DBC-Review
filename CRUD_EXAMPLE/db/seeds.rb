User.create(name: "Ken", email: "ken@ken.com", password: "hello")
User.create(name: "Ben", email: "ben@ben.com", password: "hello")

Skill.create(name: "Ruby", context: "beginner")

UserSkill.create(user_id: 1, skill_id: 1, years: 1, formal: false)
