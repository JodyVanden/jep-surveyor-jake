query = """
query {
  testField
}
"""

result = SurveyorSchema.execute(query: query)

p result