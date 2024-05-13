resource "aws_organizations_organizational_unit" "firsttestou" {
    name      = "firsttestou"
    parent_id = var.root_id
}