terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"

}

resource "aws_iam_user_group_membership" "student3" {
  user = aws_iam_user.student3.name

  groups = [
    aws_iam_group.Highschool.name,
    aws_iam_group.College.name,
  ]

}

resource "aws_iam_user" "student3" {
  name = "student3"
}

resource "aws_iam_group" "Highschool" {
  name = "Highschool"
}

resource "aws_iam_group" "College" {
  name = "College"
}



# Attach the AdministratorAccess policy to the groups

resource "aws_iam_group_policy_attachment" "Highschool_admin_access" {
  group      = aws_iam_group.Highschool.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_user_group_membership" "student3_membership" {
  user   = aws_iam_user.student3.name
  groups = [aws_iam_group.Highschool.name, aws_iam_group.College.name]
}

resource "aws_iam_user_group_membership" "student3_membership" {
  user   = aws_iam_user.student3.name
  groups = aws_iam_group.College.name
}





