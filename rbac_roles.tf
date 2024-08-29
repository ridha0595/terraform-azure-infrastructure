

resource "azurerm_role_assignment" "example_role" {
  principal_id   = "8c928736-c2a2-4fd4-ab3a-446204a3870e"
  role_definition_name = "Contributor"
  scope           = azurerm_resource_group.rg.id
}
