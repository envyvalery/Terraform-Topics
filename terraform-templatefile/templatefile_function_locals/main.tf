locals {
  policy = templatefile("${path.module}/policy.tpl", {
    name = "Justin"
  })
}

output "policy" {
  value = "${local.policy}"
}

resource "null_resource" "pretend_aws_iam_policy" {
  triggers = {
    policy = "${local.policy}"
  }

  provisioner "local-exec" {
    command = "echo ${local.policy}"
  }
}
